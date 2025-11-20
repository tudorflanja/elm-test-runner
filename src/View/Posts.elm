module View.Posts exposing (..)

import Html exposing (Html, div, text, table, th, tr, td, tbody,a,form,label,select,option,input)
import Html.Attributes exposing (class,href,type_,for,id,checked)
import Model exposing (Msg(..))
import Model.Post exposing (Post)
import Model.PostsConfig exposing (PostsConfig)
import Util.Time exposing (formatTime)
import Time exposing (Posix)

{-| Show posts as an HTML table

Relevant library functions:

  - [Html.table](https://package.elm-lang.org/packages/elm/html/latest/Html#table)
  - [Html.tr](https://package.elm-lang.org/packages/elm/html/latest/Html#tr)
  - [Html.th](https://package.elm-lang.org/packages/elm/html/latest/Html#th)
  - [Html.td](https://package.elm-lang.org/packages/elm/html/latest/Html#td)

-}
postTable : PostsConfig -> Posix -> List Post -> Html Msg
postTable config currentTime posts =
    table []
        [ 
             tr []
                [ th [class "post-score"] [text "Score"]
                , th [class "post-title"] [text "Title"]
                , th [class "post-type"] [text "Type"]
                , th [class "post-time"] [text "Posted Date"]
                , th [class "post-url"] [text "Link"]
                ]
            
     
      ]  

maybeLink : Maybe String -> Html msg
maybeLink maybeUrl =
    case maybeUrl of
        Just url ->
            a [ href url ] [ text "Link" ]
        Nothing ->
            text "No Link"

postRow : PostsConfig -> Posix -> Post -> Html Msg
postRow config currentTime post =
    tr []
        [ td [class "post-score"] [text (String.fromInt post.score)]
        , td [class "post-title"] [text post.title]
        , td [class "post-type"] [text post.type_]
        , td [class "post-time"] [text (Util.Time.formatTime Time.utc post.time)]
        , td [class "post-url"] [ maybeLink post.url] 
        ]

postsConfigView : PostsConfig -> Html Msg
postsConfigView config =
    div []
        [ form []
            [ label [ for "select-posts-per-page" ] [ text "Posts per page:" ]
            , select [ id "select-posts-per-page" ] [ option [] [ text "10" ], option [] [ text "25" ], option [] [ text "50" ] ]
            
            , label [ for "select-sort-by" ] [ text "Sort by:" ]
            , select [ id "select-sort-by" ]
                [ option [] [ text "Score" ]
                , option [] [ text "Title" ]
                , option [] [ text "Date posted" ]
                , option [] [ text "Unsorted" ]
                ]
            
            , label [ for "checkbox-show-job-posts" ] [ input [ type_ "checkbox", id "checkbox-show-job-posts", checked config.showJobs ] [], text "Show job posts" ]
            
            , label [ for "checkbox-show-text-only-posts" ] [ input [ type_ "checkbox", id "checkbox-show-text-only-posts", checked config.showTextOnly ] [], text "Show text-only posts" ]
            ]
        ]
