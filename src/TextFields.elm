module TextFields exposing (..)

import Browser
import Html exposing (Html, Attribute, div, input, text)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

-- MAIN
main = Browser.sandbox { init = init, update = update, view = view }

-- MODEL
 -- I always start by guessing at what my Model should be. 
  -- We know we have to keep track of whatever the user has typed into the text field. 
    -- We need that information to know how to render the reversed text. So we go with this:
-- This time I chose to represent the model as a record. The record stores the user input in the content field.
type alias Model = 
  { content : String
  }

init : Model 
init = 
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
-- The interesting child is the <input> node which has three attributes:
  -- placeholder is the text that shows when there is no content
  -- value is the current content of this <input>
  -- onInput sends messages when the user types in this <input> node
view : Model -> Html Msg
view model =
  div [] 
    [ input [ placeholder "Text to reverse", value model.content, onInput Change ] []
    , div [] [ text (String.reverse model.content) ]
    , div [] 
    [ text ("length: ")
    , text (String.fromInt (String.length model.content)) ]
    ]
