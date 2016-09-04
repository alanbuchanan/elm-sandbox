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


positionStyle : Html.Attribute Msg
positionStyle =
    style
        [ ( "display", "flex" )
        , ( "justify-content", "center" )
        , ( "align-items", "center" )
        , ( "flex-direction", "column" )
        ]


inputStyle : Html.Attribute Msg
inputStyle =
    style
        [ ( "font-size", "30px" )
        , ( "padding", "10px" )
        , ( "width", "600px" )
        ]


imageStyle : Html.Attribute Msg
imageStyle =
    style [ ( "max-width", "200px" ) ]


gitHubStr : String -> String
gitHubStr user =
    "https://github.com/" ++ user


view : Model -> Html Msg
view model =
    div
        [ positionStyle
        ]
        [ input
            [ placeholder "Search for a Github user..."
            , onInput Change
            , inputStyle
            ]
            []
        , div []
            [ h5 [] [ text model.username ]
            ]
        , a [ href (gitHubStr model.username) ]
            [ img
                [ src (gitHubStr model.username ++ ".png")
                , imageStyle
                ]
                []
            ]
        ]
