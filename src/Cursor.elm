module Cursor exposing (Cursor, back, current, forward, fromList, length, nonEmpty, toList, withSelectedElement)

type Cursor a
    = Cursor (List a) a (List a)

withSelectedElement : List a -> a -> List a -> Cursor a
withSelectedElement left mid right =
    Cursor (List.reverse left) mid right

nonEmpty : a -> List a -> Cursor a
nonEmpty x xs =
    Cursor [] x xs

fromList : List a -> Maybe (Cursor a)
fromList list =
    case list of
        [] ->
            Nothing

        x :: xs ->
            Just (nonEmpty x xs)


toList : Cursor a -> List a
toList (Cursor left mid right) =
    List.reverse left ++ [mid] ++ right

current : Cursor a -> a
current (Cursor _ a _) =
    a

forward : Cursor a -> Maybe (Cursor a)
forward cursor =
    case cursor of
        Cursor _ _ [] ->
            Nothing

        Cursor left mid (x :: right) ->
            Just (withSelectedElement (mid :: left) x right)


back : Cursor a -> Maybe (Cursor a)
back cursor =
    case cursor of
        Cursor [] _ _ ->
            Nothing

        Cursor (x :: xs) y zs ->
            Just (Cursor xs x (y :: zs))


length : Cursor a -> Int
length (Cursor left _ right) =
    List.length left + 1 + List.length right
