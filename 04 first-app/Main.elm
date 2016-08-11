module Main exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)
import Html.App as App
import String


-- model


type alias Model =
    { count : Int, inc : Int }


initModel : Model
initModel =
    { count = 0, inc = 1 }



-- update


type Msg
    = AddCalorie
    | UpdateInc String
    | Clear


update : Msg -> Model -> Model
update msg model =
    case msg of
        AddCalorie ->
            { model | count = model.count + model.inc }

        UpdateInc newInc ->
            { model
                | inc =
                    (String.toInt newInc
                        |> Result.toMaybe
                        |> Maybe.withDefault model.inc
                    )
            }

        Clear ->
            initModel



-- view


view : Model -> Html Msg
view model =
    div []
        [ h3 []
            [ text ("Total Calories: " ++ (toString model.count)) ]
        , input [ placeholder "Enter increment", onInput UpdateInc ] []
        , button
            [ type' "button"
            , onClick AddCalorie
            ]
            [ text "Add" ]
        , button
            [ type' "button"
            , onClick Clear
            ]
            [ text "Clear" ]
        ]


main : Program Never
main =
    App.beginnerProgram
        { model = initModel
        , update = update
        , view = view
        }
