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
