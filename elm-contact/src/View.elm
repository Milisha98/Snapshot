module View exposing (view)

import Types exposing (Model, Msg(..))
import Helper exposing (ifTrue)
import Html exposing (..)
import Html.Attributes exposing (..)
--import Html.Attributes.Aria exposing (ariaHidden, ariaLabel)
import Html.Events exposing (onClick, onInput)
import Types exposing ( Msg(..))



--
-- VIEW
--


view : Model -> Html Msg
view contact =
    div [ class "fit-content no-pad" ]
        [ div [ class "header hidden-sm hidden-md" ] [ h2 [] [ text "Contact Details" ] ]
        , div [ id "contact-container", class "container no-pad" ]
            [ div [ class "row form-box-right" ]
                -- Name
                [ div [ class "col-sm-12 col-lg-6 input-group form-box" ]
                    [ div [ class "container" ]
                        [ div [ class "row" ] [ div [ class "col-sm-12" ] [ label [ for "contact-name", class "form-label" ] [ text "contact name" ] ] ]
                        , div [ class "row " ] [ div [ class "col-sm-12" ] [ input [ id "contact-name", type_ "text", class "full-width", value contact.name, onInput ChangeContactName, contact |> isRequired |> required, maxlength 100 ] [] ] ]
                        ]
                    ]

                -- Email
                , div [ class "col-sm-12 col-lg-6 input-group form-box" ]
                    [ div [ class "container" ]
                        [ div [ class "row" ] [ div [ class "col-sm-12" ] [ label [ for "contact-email", class "form-label" ] [ text "e-mail" ] ] ]
                        , div [ class "row " ] [ div [ class "col-sm-12" ] [ input [ id "contact-email", type_ "email", class "full-width", value contact.email, onInput ChangeContactEmail, contact |> isRequired |> required, maxlength 254 ] [] ] ]
                        ]
                    ]
                ]
            , div [ class "row form-box-right" ]
                -- Street Address 1
                [ div [ class "col-sm-12 col-lg-6 input-group form-box" ]
                    [ div [ class "container" ]
                        [ div [ class "row" ] [ div [ class "col-sm-8" ] [ label [ for "contact-street1", class "form-label" ] [ text "street address 1" ] ], div [ class "col-sm-4 optional" ] [ text "Optional" ] ]
                        , div [ class "row " ] [ div [ class "col-sm-12" ] [ input [ id "contact-street1", type_ "text", class "full-width", value contact.street1, onInput ChangeContactStreet1, maxlength 128 ] [] ] ]
                        ]
                    ]

                -- Street Address 2
                , div [ class "col-sm-12 col-lg-6 input-group form-box" ]
                    [ div [ class "container" ]
                        [ div [ class "row" ] [ div [ class "col-sm-8" ] [ label [ for "contact-street2", class "form-label" ] [ text "street address 2" ] ], div [ class "col-sm-4 optional" ] [ text "Optional" ] ]
                        , div [ class "row " ] [ div [ class "col-sm-12" ] [ input [ id "contact-street2", type_ "text", class "full-width", value contact.street2, onInput ChangeContactStreet2, maxlength 128 ] [] ] ]
                        ]
                    ]
                ]
            , div [ class "row form-box-right form-box-bottom" ]
                -- City
                [ div [ class "col-sm-4 col-lg-2 input-group form-box" ]
                    [ div [ class "container" ]
                        [ div [ class "row" ] [ div [ class "col-md-8 col-sm-12" ] [ label [ for "contact-city", class "form-label" ] [ text "town / suburb" ] ], div [ class "hidden-sm col-md optional" ] [ text "Optional" ] ]
                        , div [ class "row " ] [ div [ class "col-sm-12" ] [ input [ id "contact-city", type_ "text", class "full-width", value contact.city, onInput ChangeContactCity, maxlength 50 ] [] ] ]
                        ]
                    ]

                -- State
                , div [ class "col-sm-4 col-lg-2 input-group form-box" ]
                    [ div [ class "container" ]
                        [ div [ class "row" ] [ div [ class "col-md-8 col-sm-12" ] [ label [ for "contact-state", class "form-label hidden-lg hidden-md" ] [ text "state" ], label [ for "contact-state", class "form-label hidden-sm" ] [ text "state / province" ] ], div [ class "hidden-sm col-md optional" ] [ text "Optional" ] ]
                        , div [ class "row " ] [ div [ class "col-sm-12" ] [ input [ id "contact-state", type_ "text", class "full-width", value contact.state, onInput ChangeContactState, maxlength 50 ] [] ] ]
                        ]
                    ]

                -- Post Code
                , div [ class "col-sm-4 col-lg-2 input-group form-box" ]
                    [ div [ class "container" ]
                        [ div [ class "row" ] [ div [ class "col-md-8 col-sm-12" ] [ label [ for "contact-postcode", class "form-label" ] [ text "post / zip code" ] ], div [ class "hidden-sm col-md optional" ] [ text "Optional" ] ]
                        , div [ class "row " ] [ div [ class "col-sm-12" ] [ input [ id "contact-postcode", type_ "text", class "full-width", value contact.postCode, onInput ChangeContactPostCode, maxlength 12 ] [] ] ]
                        ]
                    ]
                , -- Phone
                  div [ class "col-sm-6 col-lg-3 input-group form-box" ]
                    [ div [ class "container" ]
                        [ div [ class "row" ] [ div [ class "col-sm-8" ] [ label [ for "contact-phone", class "form-label" ] [ text "phone" ] ], div [ class "col-sm-4 optional" ] [ text "Optional" ] ]
                        , div [ class "row " ] [ div [ class "col-sm-12" ] [ input [ id "contact-phone", type_ "tel", pattern "[()\\d\\s-]+", class "full-width", value contact.phone, onInput ChangeContactPhone, maxlength 15 ] [] ] ]
                        ]
                    ]
                , -- Mobile
                  div [ class "col-sm-6 col-lg-3 input-group form-box" ]
                    [ div [ class "container" ]
                        [ div [ class "row" ] [ div [ class "col-md-8 col-sm-8" ] [ label [ for "contact-mobile", class "form-label" ] [ text "cell / mobile phone" ] ], div [ class "col-sm optional" ] [ text "Optional" ] ]
                        , div [ class "row " ] [ div [ class "col-sm-12" ] [ input [ id "contact-mobile", type_ "tel", pattern "[()\\d\\s-]+", class "full-width", value contact.mobile, onInput ChangeContactMobile, maxlength 15 ] [] ] ]
                        ]
                    ]
                ]

                , div [ class "row form-box-right form-box-bottom" ]
                    [ -- Next Button
                    div [ class "col-sm-12 form-box submit-button-container" ]
                        [ button [ class "large tertiary submit-button", onClick (Save) ] [ span [ class "hidden-sm hidden-md" ] [ text "SAVE" ], span [ class "hidden-lg" ] [ text "SAVE" ] ] ]
                    ]
                -- Display Errors
                , displayErrors contact

                -- Debugging
                -- , Html.hr [] []
                -- , text (Debug.toString contact)
            ]
        ]

isRequired : Model -> Bool
isRequired model =
    model.validationMessages /= []


displayErrors : Model -> Html Msg
displayErrors model =
    if model |> isRequired then
        model.validationMessages |> viewErrors
    else
        text ""

viewErrors : List String -> Html Msg
viewErrors errors =
    div [ class "toast error-toast container" ]
        [ div [ class "row" ]
            [ div [ class "col-sm-1 error-icon" ] [ Html.i [ class "fas fa-exclamation-triangle" ] [] ]
            , div [ class "col-sm-11 error-text" ] (errors |> List.map (\e -> span [] [ text e, Html.br [] [] ]))
            ]
        ]