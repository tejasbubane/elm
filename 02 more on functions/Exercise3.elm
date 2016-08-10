module Main exposing (..)

import Html
import String


wordCount sentence =
    List.length (String.split " " sentence)


main =
    Html.text (toString (wordCount "elm is awesome!"))
