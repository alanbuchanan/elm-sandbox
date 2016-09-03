import Html exposing (..)
import Html.Attributes exposing (..)
import String
import Html.App as App
import Html.Events exposing (onInput)

main =
  App.beginnerProgram { model = model, view = view, update = update }

-- MODEL
type alias Model =
  { content : String
  }

model : Model
model =
  { content = "" }

-- UPDATE
type Msg =
  Change String

update : Msg -> Model -> Model
update msg model =
  case msg of
    Change newContent ->
      { model | content = newContent }


-- VIEW

view : Model -> Html Msg
view model =
  div []
    [ input [ placeholder "Enter text", onInput Change ] []
    , div [] [ text (String.reverse model.content) ]
    ]