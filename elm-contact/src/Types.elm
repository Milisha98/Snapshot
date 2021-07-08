module Types exposing (Model, Msg(..))


type alias Model =
    { name : String
    , email : String
    , street1 : String
    , street2 : String
    , city : String
    , state : String
    , postCode : String
    , country : String
    , phone : String
    , mobile : String
    , isActive : Bool
    , validationMessages : List ( String )
    }

type Msg
    = NoOp
    | ChangeContactName String
    | ChangeContactEmail String
    | ChangeContactStreet1 String
    | ChangeContactStreet2 String
    | ChangeContactCity String
    | ChangeContactState String
    | ChangeContactPostCode String
    | ChangeContactPhone String
    | ChangeContactMobile String
    | Save

