module Main exposing (..)

import Html exposing (..)
import Html.App as App
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)


main =
    App.beginnerProgram { model = model, view = view, update = update }



-- MODEL


type alias Model =
    { username : String }


model : Model
model =
    { username = "" }



-- UPDATE


type Msg
    = Change String


update : Msg -> Model -> Model
update msg model =
    case msg of
        Change newUsername ->
            { model | username = newUsername }



-- VIEW


view : Model -> Html Msg
view model =
    div
        [ style
            [ ( "display", "flex" )
            , ( "justify-content", "center" )
            , ( "align-items", "center" )
            , ( "flex-direction", "column" )
            ]
        ]
        [ input
            [ placeholder "Search for a Github username"
            , onInput Change
            , style
                [ ( "font-size", "30px" )
                , ( "padding", "10px" )
                , ( "width", "600px" )
                ]
            ]
            []
        , div []
            [ h5 [] [ text model.username ]
            ]
        , a [ href ("https://github.com/" ++ model.username) ]
            [ img
                [ src ("https://github.com/" ++ model.username ++ ".png")
                , style [ ( "max-width", "200px" ) ]
                ]
                []
            ]
        ]
