port module Main exposing (main)

import Browser
import Html exposing (Html, button, div, text)
import Html.Events exposing (onClick)


port hello : String -> Cmd msg


port reply : (Int -> msg) -> Sub msg


type alias Model =
    Int


init : String -> ( Model, Cmd Msg )
init _ =
    ( 0, hello "World" )


type Msg
    = Increment
    | Decrement
    | ReplyReceived Int


view : Model -> Html Msg
view model =
    div []
        [ button [ onClick Decrement ] [ text "---" ]
        , div [] [ text (String.fromInt model) ]
        , button [ onClick Increment ] [ text "+++" ]
        ]


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        Increment ->
            ( model + 1, Cmd.none )

        Decrement ->
            ( model - 1, Cmd.none )

        ReplyReceived message ->
            let
                _ =
                    Debug.log "ReplyReceived" message
            in
            ( model, Cmd.none )


subscriptions : Model -> Sub Msg
subscriptions model =
    reply ReplyReceived


main : Program String Model Msg
main =
    Browser.document
        { init = init
        , update = update
        , view =
            \m ->
                { title = "Elm 0.19 starter"
                , body = [ view m ]
                }
        , subscriptions = \_ -> Sub.none
        }
