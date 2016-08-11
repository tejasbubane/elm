module Main exposing (..)

import Html


add a b =
    a + b


result =
    -- add 1 2
    -- add 1 2 |> add 3
    add 4 2 |> \a -> a % 2 == 0


counter =
    0


main =
    Html.text (toString result)
