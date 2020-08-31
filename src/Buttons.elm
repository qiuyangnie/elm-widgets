module Buttons exposing (..)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)

-- MAIN:
-- It describes what gets shown on screen.
main =
  Browser.sandbox { init = init, update = update, view = view }


-- MODEL:
-- The point of the model is to capture all the details about your application as data.
  -- To make a counter, we need to keep track of a number that is going up and down. 
    -- That means our model is really small this time:
type alias Model = Int

init : Model
init = 
  0


-- VIEW:
-- We have a model, but how do we show it on screen? That is the role of the view function:
  -- This function takes in the Model as an argument. It outputs HTML. 
    -- So we are saying that we want to show a decrement button, the current count, and an increment button.
-- Notice that we have an onClick handler for each button. 
  -- These are saying: when someone clicks, generate a message. 
    -- So the plus button is generating an Increment message. 
      -- What is that and where does it go? To the update function!
view : Model -> Html Msg
view model = 
  div [] 
    [ button [ onClick Increment ] [ text "+" ]
    , button [ onClick IncrementOfTen ] [ text "+10" ]
    , div [] [ text (String.fromInt model) ]
    , button [ onClick Decrement ] [ text "-" ]
    , button [ onClick DecrementOfTen ] [ text "-10" ]
    , button [ onClick Reset ] [ text "Reset" ]
    ]


-- UPDATE:
-- The update function describes how our Model will change over time.
  -- We define two messages that it might receive:
type Msg
  = Increment
  | IncrementOfTen
  | Decrement
  | DecrementOfTen
  | Reset

-- From there, the update function just describes what to do when you receive one of these messages.
update : Msg -> Model -> Model
update msg model =
  case msg of 
    Increment ->
      model + 1

    IncrementOfTen ->
      model + 10

    Decrement ->
      model - 1

    DecrementOfTen ->
      model - 10

    Reset ->
      init
