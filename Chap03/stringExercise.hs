-- stringExercise.hs
module StringExercise where

withoutFirstCharacter :: String -> [Char]
withoutFirstCharacter s = tail s

exclamation :: String -> String
exclamation s = s ++ "!"

fifthLetter :: String -> Char
fifthLetter s = s !! 4

dropNine :: String -> String
dropNine s = drop 9 s

thirdLetter :: String -> Char
thirdLetter s = s !! 2

letterIndex :: Int -> Char
letterIndex i = str !! i
  where str = "Curry is awesome!"

-- x = "Curry is awesome"
-- supposed to return "awesome is Curry"
rvrs :: String -> String
rvrs x = concat [awesome, is, curry]
  where
    awesome = drop 9 x
    is = concat [[head $ drop 5 x],
                 [head $ drop 6 x],
                 [head $ drop 7 x],
                 [head $ drop 8 x]]
    curry = take 5 x
