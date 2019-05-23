< Count : Natural
| Full :
  { max : Natural
  , when :
    < Single : ./RetryWhen.dhall
    | Multiple : List ./RetryWhen.dhall
    >
  }
>
