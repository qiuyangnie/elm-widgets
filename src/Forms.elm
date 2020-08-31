module Forms exposing (..)

import Browser
import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onInput)

-- Main:
main = 
  Browser.sandbox { init = init, update = update, view = view }

-- Model:
  -- I always start out by guessing at the Model. 
    -- We know there are going to be three text fields, so let's just go with that:
type alias Model = 
  { name : String
  , password : String
  , passwordAgain : String
  }

init : Model
init = 
  Model "" "" ""

-- Update:
  -- We know we need to be able to change our three fields, so we need messages for each case.
type Msg 
  = Name String
  | Password String
  | PasswordAgain String

-- This means our update needs a case for all three variations:
update : Msg -> Model -> Model
update msg model =
  case msg of 
    Name name -> 
      { model | name = name }

    Password password ->
      { model | password = password }

    PasswordAgain password ->
      { model | passwordAgain = password }

-- View:
  -- This view function is using helper functions to make things a bit more organized:
view : Model -> Html Msg
view model = 
  div [] 
    [ viewInput "text" "Name" model.name Name
    , viewInput "password" "Password" model.password Password
    , viewInput "password" "Re-enter Password" model.passwordAgain PasswordAgain
    , viewValidation model 
    ]

-- The neat thing about HTML in Elm is that input and div are just normal functions. 
  -- They take (1) a list of attributes and (2) a list of child nodes. 
    -- Since we are using normal Elm functions, we have the full power of Elm to help us build our views! 
      -- We can refactor repetitive code out into customized helper functions. 
        -- That is exactly what we are doing here!
viewInput : String -> String -> String -> (String -> msg) -> Html msg
viewInput t p v toMsg =
  input [ type_ t, placeholder p, value v, onInput toMsg ] []

viewValidation : Model -> Html msg
viewValidation model =
  if model.password == model.passwordAgain then 
    div [ style "color" "green" ] [ text "OK" ]
  else
    div [ style "color" "red" ] [ text "Passwords do not match!" ]

