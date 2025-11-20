module Util.Time exposing (..)

import Time

type Date
    = Date { year : Int, month : Time.Month, day : Int }


monthToString : Time.Month -> String
monthToString month =
    case month of
        Time.Jan ->
            "Jan"

        Time.Feb ->
            "Feb"

        Time.Mar ->
            "Mar"

        Time.Apr ->
            "Apr"

        Time.May ->
            "May"

        Time.Jun ->
            "Jun"

        Time.Jul ->
            "Jul"

        Time.Aug ->
            "Aug"

        Time.Sep ->
            "Sep"

        Time.Oct ->
            "Oct"

        Time.Nov ->
            "Nov"

        Time.Dec ->
            "Dec"

posixToDate : Time.Zone -> Time.Posix -> Date
posixToDate tz time =
    let
        year =
            Time.toYear tz time

        month =
            Time.toMonth tz time

        day =
            Time.toDay tz time
    in
    Date { year = year, month = month, day = day }

formatDate : Date -> String
formatDate (Date date) =
    let
        year =
            String.fromInt date.year

        month =
            monthToString date.month

        day =
            String.fromInt date.day |> String.padLeft 2 '0'
    in
    year ++ " " ++ month ++ " " ++ day

formatTime : Time.Zone -> Time.Posix -> String
formatTime tz time =
    let
        date =
            posixToDate tz time

        hour =
            Time.toHour tz time |> String.fromInt |> String.padLeft 2 '0'

        minute =
            Time.toMinute tz time |> String.fromInt |> String.padLeft 2 '0'
    in
    formatDate date ++ " " ++ hour ++ ":" ++ minute

type alias Duration =
    { seconds : Int
    , minutes : Int
    , hours : Int
    , days : Int
    }

durationBetween : Time.Posix -> Time.Posix -> Maybe Duration
durationBetween t1 t2 =
    let
        diffMillis =
            Time.posixToMillis t2 - Time.posixToMillis t1

        toDuration : Int -> Duration
        toDuration durationInMs =
            let
                seconds =
                    modBy (durationInMs // 1000) 60

                minutes =
                    modBy (durationInMs // (1000 * 60)) 60

                hours =
                    modBy (durationInMs // (1000 * 60 * 60)) 24

                days =
                    durationInMs // (1000 * 60 * 60 * 24)
            in
            { seconds = seconds, minutes = minutes, hours = hours, days = days }
    in
    if diffMillis >= 0 then
        Just (toDuration diffMillis)
    else
        Nothing

formatDuration : Duration -> String
formatDuration duration =
    let
        unitString : String -> Int -> String
        unitString unit value =
            if value == 1 then
                unit
            else
                unit ++ "s"
    in
    case duration of
        { seconds, minutes, hours, days } ->
            let
                formatPart : String -> Int -> String
                formatPart unit value =
                    if value > 0 then
                        String.fromInt value ++ " " ++ unitString unit value ++ " "
                    else
                        ""
            in
            formatPart "day" days ++ formatPart "hour" hours ++ formatPart "minute" minutes ++ formatPart "second" seconds
    

