module Main exposing (..)

import Html
import String as S


uppercaseName name =
    if S.length (name) > 10 then
        S.toUpper name
    else
        name


main =
    let
        name =
            "Tejas Bubane"

        upName =
            uppercaseName (name)
    in
        Html.text (S.concat [ upName, " - name length: ", toString (S.length (name)) ])
