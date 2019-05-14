let Service =
< Full :
{ name : Text
, entrypoint : Text
, command : List Text
, alias : Text
} | Image : Text >

in
{ stage : Text
, variables :
    List { mapKey : Text, mapValue : Text}
, script : < Command : Text | Array : List Text >
, services : List Service
, only : List Text
}
