-- |

module Chap13.Palindrome where

import Control.Monad (forever)
import Data.Char (toLower)

palindrome :: IO ()
palindrome = forever $ do
  line1 <- getLine
  case cleanLine line1 == reverse (cleanLine line1) of
    True  -> putStrLn "It's a palindrome!"
    False -> putStrLn "Nope!"
    where
      cleanLine :: String -> String
      cleanLine xs = [toLower x | x <- xs, x `elem` ['a'..'z']]
