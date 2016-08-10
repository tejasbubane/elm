module Main exposing (..)

import Html


cart =
    [ { name = "Lemon", qty = 1, freeQty = 0 }
    , { name = "Apple", qty = 5, freeQty = 0 }
    , { name = "Pear", qty = 10, freeQty = 0 }
    ]


discount minQty freeQty item =
    if item.qty >= minQty then
        { item | freeQty = freeQty }
    else
        item


finalCart =
    List.map ((discount 5 1) >> (discount 10 3)) cart


main =
    Html.text (toString finalCart)
