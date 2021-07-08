module Helper exposing (earliestDate, excludeNothings, ifTrue, timesAreEqual)


import Html exposing (..)
import Html.Attributes exposing (..)


import Time exposing (..)

import Types exposing (..)


ifTrue f a b =
    if f then
        a

    else
        b



excludeNothings : List (Maybe a) -> List a
excludeNothings list =
    let
        loop acc lst =
            case lst of
                h :: t ->
                    case h of
                        Just x ->
                            loop (x :: acc) t

                        Nothing ->
                            loop acc t

                [] ->
                    acc
    in
    loop [] list







--
-- Other Date Helpers
--


earliestDate : Time.Posix -> Time.Posix -> Time.Posix
earliestDate a b =
    [ a, b ]
        |> List.map Time.posixToMillis
        |> List.filter (\x -> x > 0)
        |> List.minimum
        |> Maybe.map (\x -> x |> Time.millisToPosix)
        |> Maybe.withDefault a


timesAreEqual : Time.Posix -> Time.Posix -> Bool
timesAreEqual a b =
    (a |> Time.posixToMillis) == (b |> Time.posixToMillis)




