let Job = ./types/Job.dhall

in [
  { mapKey = "build_test_publish"
  , mapValue =
    { stage = "build_test_publish"
    , variables =
      [ { mapKey = "MYSQL_ROOT_PASSWORD", mapValue = "root" }
      , { mapKey = "MYSQL_USER", mapValue = "campaigner" }
      , { mapKey = "MYSQL_PASSWORD", mapValue = "campaigner" }
      , { mapKey = "MYSQL_DATABASE", mapValue = "campaigner-test" }
      ]
    }
  }
]
