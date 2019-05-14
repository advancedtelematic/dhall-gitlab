# dhall-gitlab

Dhall types for configuring gitlab-ci jobs

## Running locally

If you have `docker` installed run the following:

```
make create-config-toml
make start-gitlab-ce
```

Add the following line to your `/etc/hosts` file:

```
127.0.0.1	gitlab
```

Go to http://gitlab:30080 and log in with the credentials `root:password`.

```
make start-runner-shell
make start-runner-docker
```

Go to http://gitlab:30080/projects/new and create a public project named dhall-gitlab.

Add an ssh key at http://gitlab:30080/profile/keys

```
git remote add local ssh://git@gitlab:30022/root/dhall-gitlab.git
git push -u local master
```

You now have 2 runners, and a repo that should trigger a simple job. If there are issues take a look at he status of the runners here: http://gitlab:30080/admin/runners

## License

This code is licensed under the Mozilla Public License 2.0, a copy of which can be found in this repository. All code is copyright 2018 HERE Europe B.V.
