module Main exposing (main)

import Browser
import State exposing (..)
import Types exposing (..)
import View exposing (view)



-- PROGRAM


main =
    Browser.element
        { init = init
        , view = view
        , update = updateModel
        , subscriptions = subscriptions
        }
