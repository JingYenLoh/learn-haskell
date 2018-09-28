-- poemLines.hs
module PoemLines where

-- import Chap09.ThyFearfulSymmetry (myTokens)

sentences :: String
sentences = firstSen ++ secondSen
         ++ thirdSen ++ fourthSen
         where
          firstSen  = "Tyger Tyger, burning bright\n"
          secondSen = "In the forests of the night\n"
          thirdSen  = "What immortal hand or eye\n"
          fourthSen = "Could frame thy fearful symmetry?"

myLines :: String -> [String]
myLines ""  = []
myLines str = line str : (myLines $ lines str)
  where line  = takeWhile (/= '\n')
        lines = drop 1 . dropWhile (/='\n')


shouldEqual :: [String]
shouldEqual =
  [ "Tyger Tyger, burning bright"
  , "In the forests of the night"
  , "What immortal hand or eye"
  , "Could frame thy fearful symmetry?"
  ]

main :: IO ()
main =
  print $ "Are they equal? "
        ++ show (myLines sentences == shouldEqual)
