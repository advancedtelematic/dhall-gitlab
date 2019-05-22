let Service =
  < Full :
  { name : Text
  , entrypoint : Text
  , command : List Text
  , alias : Text
  }
  | Image : Text >

let Script =
  < Command : Text | Array : List Text >

let When =
  < on_success | on_failure | always | manual >

let Environment =
  { name : Text
  , url : Optional Text
  }

let Policy =
  < pull >

let Cache =
  { paths : List Text
  , key : Optional Text
  , untracked : Optional Bool
  , policy : Optional Policy
  }

let Artifacts =
  { paths : Optional (List Text)
  , name : Optional Text
  , untracked : Optional Bool
  , when :
    Optional < on_success | on_failure | always >
  , expire_in : Optional Text
  , reports :
    Optional
    { junit : Optional < Single : Text | Multiple : (List Text) >
    , codequality : Optional Text
    , sast : Optional Text
    , dependency_scanning : Optional Text
    , container_scanning : Optional Text
    , dast : Optional Text
    , license_management : Optional Text
    , performance : Optional Text
    , metrics : Optional Text
    }
  }

let RetryWhen =
  < always
  | unknown_failure
  | script_failure
  | api_failure
  | stuck_or_timeout_failure
  | runner_system_failure
  | missing_dependency_failure
  | runner_unsupported
  >

let Retry =
  < Count : Natural
  | Full :
    { max : Natural
    , when :
      < Single : RetryWhen
      | Multiple : List RetryWhen
      >
    }
  >

let Trigger =
  < Simple : Text
  | Complex :
    { project: Text
    , branch: Text
    }
  >

let Include =
  < Single : Text
  | Multiple : List Text
  | Local : { local : Text }
  | File :
    { project : Text
    , file : Text
    , ref : Optional Text
    }
  | Template : { template : Text }
  | Remote : { remote : Text }
  >

-- TODO add Pages somehow https://docs.gitlab.com/ee/ci/yaml/#pages
in
{ after_script : Optional Script
, allow_failure : Optional Bool
, artifacts : Optional Artifacts
, before_script : Optional Script
, cache : Optional Cache
, coverage : Optional Text
, dependencies : Optional (List Text)
, environment : Optional Environment -- TODO complicated
, except : List Text -- TODO complicated
, extends : Optional Text
, include : Optional (List Include)
, only : List Text -- TODO complicated
, parallel : Optional Natural
, retry : Optional Retry
, script : Script
, services : List Service
, stage : Text
, tags : Optional (List Text)
, trigger : Trigger
, variables :
    List { mapKey : Text, mapValue : Text}
, when : Optional When
}
