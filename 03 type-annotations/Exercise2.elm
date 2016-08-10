module Main exposing (..)

import Html


type alias Item =
    { name : String, qty : Int, freeQty : Int }


cart : List Item
cart =
    [ { name = "Lemon", qty = 1, freeQty = 0 }
    , { name = "Apple", qty = 5, freeQty = 0 }
    , { name = "Pear", qty = 10, freeQty = 0 }
    ]


discount : Int -> Int -> Item -> Item
discount minQty freeQty item =
    if item.qty >= minQty then
        { item | freeQty = freeQty }
    else
        item


result : List Item
result =
    List.map ((discount 5 1) >> (discount 10 3)) cart


main : Html.Html msg
main =
    Html.text (toString result)
