module Countries exposing (Country, countries, getSymbolFromCountryString, initialCountry, stringToCountry)


type alias Country =
    { country : String
    , currency : String
    , symbol : String
    }


countries : List Country
countries =
    [ Country "Australia" "AUD" "$"
    , Country "Austria" "EUR" "€"
    , Country "Belgium" "EUR" "€"
    , Country "Canada" "CAD" "$"
    , Country "Denmark" "DKK" "Kr"
    , Country "Finland" "EUR" "€"
    , Country "France" "EUR" "€"
    , Country "Germany" "EUR" "€"
    , Country "Hong Kong" "HKD" "$"
    , Country "Ireland" "EUR" "€"
    , Country "Japan" "JPY" "¥"
    , Country "Luxembourg" "EUR" "€"
    , Country "Netherlands" "EUR" "€"
    , Country "New Zealand" "NZD" "$"
    , Country "Norway" "EUR" "kr"
    , Country "Singapore" "SGD" "$"
    , Country "Spain" "EUR" "€"
    , Country "Sweden" "SEK" "kr"
    , Country "Switzerland" "CHF" "Fr"
    , Country "United Kingdom" "GBP" "£"
    , Country "United States" "USD" "$"
    , Country "Italy" "EUR" "€"
    , Country "Portugal" "EUR" "€"
    ]


initialCountry : Country
initialCountry =
    Country "Australia" "AUD" "$"


stringToCountry : String -> Country
stringToCountry c =
    countries |> List.filter (\x -> x.country == c) |> List.head |> Maybe.withDefault initialCountry


getSymbolFromCountryString : String -> String
getSymbolFromCountryString country =
    (country |> stringToCountry).symbol
