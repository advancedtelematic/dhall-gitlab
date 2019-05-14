DOCKER_RUN := \
	docker run -i --rm -v ${CURDIR}:/data --entrypoint=dhall-to-yaml advancedtelematic/dhall-json --key mk --value mv --omitNull --explain

print-yaml:
	cat ./pipelines.dhall | $(DOCKER_RUN) | tr -d '\r'

generate-yaml:
	cat ./pipelines.dhall | $(DOCKER_RUN) | tr -d '\r' > pipelines.gocd.yaml

docker-run:
	docker run -it --rm -v ${CURDIR}:/data advancedtelematic/dhall bash

create-config-toml:
	@cp runner-config.toml.example runner-config.toml

start-gitlab-ce:
	# https://developer.ibm.com/code/2017/07/13/step-step-guide-running-gitlab-ce-docker/
	docker run --detach --name gitlab \
		--hostname gitlab \
		-v /opt/gitlab/config:/etc/gitlab \
		-v /opt/gitlab/logs:/var/log/gitlab \
		-v /opt/gitlab/data:/var/opt/gitlab \
		--publish 30080:30080 \
		--publish 30022:22 \
		--env GITLAB_OMNIBUS_CONFIG="external_url 'http://gitlab:30080'; gitlab_rails['gitlab_shell_ssh_port']=30022; gitlab_rails['initial_root_password'] = 'password' ; gitlab_rails['initial_shared_runners_registration_token'] = 'reg-token123' " \
		gitlab/gitlab-ce:9.1.0-ce.0

start-runner-shell:
	@docker run -d --name runner-shell --restart always \
		--link gitlab \
	  -v $(CURDIR)/runner-config.toml:/etc/gitlab-runner/config.toml \
		-v /opt/gitlab-runner-shell/config:/etc/gitlab-runner \
		-v /var/run/docker.sock:/var/run/docker.sock \
		gitlab/gitlab-runner:latest
	@sleep 3
	@docker exec -it runner-shell gitlab-runner register --name local-shell --executor shell --url http://gitlab:30080 --non-interactive --locked=false --registration-token reg-token123

start-runner-docker:
	@docker run -d --name runner-docker --restart always \
		--link gitlab \
	  -v $(CURDIR)/runner-config.toml:/etc/gitlab-runner/config.toml \
		-v /opt/gitlab-runner-docker/config:/etc/gitlab-runner \
		-v /var/run/docker.sock:/var/run/docker.sock \
		gitlab/gitlab-runner:latest
	@sleep 3
	@docker exec -it runner-docker gitlab-runner register --name local-docker --docker-image debian:jessie-slim --executor docker --docker-links gitlab --url http://gitlab:30080 --non-interactive --locked=false --registration-token reg-token123
