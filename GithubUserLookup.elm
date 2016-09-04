module Main exposing (..)

import Html exposing (..)
import Html.App as App
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)
import String


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
    div []
        [ input [ placeholder "Search for a Github user", onInput Change ] []
        , div []
            [ h5 [] [ text model.username ]
            ]
        , div []
            [ img [ src ("https://github.com/" ++ model.username ++ ".png") ] []
            ]
        ]
