let types = ./../types.dhall

in
{ after_script = None types.Script
, allow_failure = None Bool
, artifacts = None types.Artifacts
, before_script = None types.Script
, cache = None types.Cache
, coverage = None Text
, dependencies = None (List Text)
, environment = None types.Environment
, except = None (List Text)
, extends = None Text
, include = None (List types.Include)
, only = None (List Text)
, parallel = None Natural
, retry = None types.Retry
, services = None (List types.Service)
, stage = None Text
, tags = None (List Text)
, trigger = None types.Trigger
, variables =
    None (List { mapKey : Text, mapValue : Text})
, when = None types.When
}
{-
-}
