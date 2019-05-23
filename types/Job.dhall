{ after_script : Optional ./Script.dhall
, allow_failure : Optional Bool
, artifacts : Optional ./Artifacts.dhall
, before_script : Optional ./Script.dhall
, cache : Optional ./Cache.dhall
, coverage : Optional Text
, dependencies : Optional (List Text)
, environment : Optional ./Environment.dhall -- TODO complicated
, except : Optional (List Text) -- TODO complicated
, extends : Optional Text
, include : Optional (List ./Include.dhall)
, only : Optional (List Text) -- TODO complicated
, parallel : Optional Natural
, retry : Optional ./Retry.dhall
, script : ./Script.dhall
, services : Optional (List ./Service.dhall)
, stage : Optional Text
, tags : Optional (List Text)
, trigger : Optional ./Trigger.dhall
, variables :
    Optional (List { mapKey : Text, mapValue : Text})
, when : Optional ./When.dhall
}
