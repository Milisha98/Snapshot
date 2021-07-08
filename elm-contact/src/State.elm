module State exposing (init, updateModel, validateModel, subscriptions)

import Types exposing (Model, Msg(..))
import Helper exposing (ifTrue)



--
-- INIT
--

init : String -> ( Model, Cmd Msg )
init _ = 
    (initialModel, Cmd.none)


initialModel : Model
initialModel =
    { name = ""
    , email = ""
    , street1 = ""
    , street2 = ""
    , city = ""
    , state = ""
    , postCode = ""
    , country = ""
    , phone = ""
    , mobile = ""
    , isActive = True
    , validationMessages = []
    }



--
-- UPDATE
--


updateModel : Msg -> Model -> (Model, Cmd Msg)
updateModel msg model =
    case msg of
        ChangeContactName value ->
            { model | name = value } |> cmdNone

        ChangeContactEmail value ->
            { model | email = value } |> cmdNone

        ChangeContactStreet1 value ->
            { model | street1 = value } |> cmdNone

        ChangeContactStreet2 value ->
            { model | street2 = value } |> cmdNone

        ChangeContactCity value ->
            { model | city = value } |> cmdNone

        ChangeContactState value ->
            { model | state = value } |> cmdNone

        ChangeContactPostCode value ->
            { model | postCode = value } |> cmdNone

        ChangeContactPhone value ->
            { model | phone = value } |> cmdNone

        ChangeContactMobile value ->
            { model | mobile = value } |> cmdNone

        Save ->
            case (model |> validateModel) of
                Ok m -> m |> cmdNone
                Err m -> m |> cmdNone

        NoOp ->
            model |> cmdNone

--
-- Validation
--


validateModel : Model -> Result Model Model
validateModel model =
    let
        required =
            [ ( "Name", model.name )
            , ( "E-mail", model.email )
            ]

        requiredMessages =
            required
                |> List.map (\( l, v ) -> ( l, v |> String.trim |> String.length ))
                |> List.filter (\( _, v ) -> v == 0)
                |> List.map (\( l, _ ) ->  l ++ " is a required field." )

        isEmailValid =
            case model.email |> String.indices "@" |> List.length of
                0 ->
                    ifTrue (model.email == "") [] [ "This field isn't a valid e-mail address." ]

                1 ->
                    []

                _ ->
                    [ "This field isn't a valid e-mail address." ]

        requireAll =
            List.append requiredMessages isEmailValid
    in
    case requireAll of
        [] ->
            Ok { model | validationMessages = [] }

        _ ->
            Err { model | validationMessages = requireAll }



-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none


--
-- Command Helpers
--


cmdNone : Model -> ( Model, Cmd Msg )
cmdNone model =
    ( model, Cmd.none )