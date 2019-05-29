{ paths = None (List Text)
, name = None Text
, untracked = None Bool
, when =
  None < on_success | on_failure | always >
, expire_in = None Text
, reports =
  None
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
