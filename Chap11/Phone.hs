-- Phone.hs

module Chap11.Phone where

import           Data.Function (on)
import qualified Data.Map as Map
import           Data.Monoid

data DaPhone = DaPhone
  { charToDigit :: Char -> [(Digit, Presses)]
  }

convo :: [String]
convo = ["Hello"]

type Digit = Char
type Presses = Int

reverseTaps
  :: DaPhone
  -> Char
  -> [(Digit, Presses)]
reverseTaps = charToDigit

cellPhonesDead
  :: DaPhone
  -> String
  -> [(Digit, Presses)]
cellPhonesDead phone s = reverseTaps phone =<< s

fingerTaps :: [(Digit, Presses)] -> Presses
fingerTaps = sum . fmap snd

countChars :: String -> Map Char (Sum Int)
countChars = foldMap (flip Map.singleton (Sum (1 :: Int)))

findMaxKey :: Map.Map k v -> k
findMaxKey = fst . Map.findMax

mostPopularLetter :: String -> Char
mostPopularLetter = findMaxKey . countChars

coolestLtr :: [String] -> Char
coolestLtr = findMaxKey . foldMap countChars

newtype Map' k v = Map' { unMap :: Map.Map k v }

instance (Ord k, Semigroup v) => Semigroup (Map' k v) where
  (<>) = (Map' . ) . Map.unionWith (<>) `on` unMap

instance (Ord k, Monoid v) => Monoid (Map' k v) where
  mempty = Map' mempty
  mappend = (<>)


First Nothing <> First (Just 3) = First (Just 3)
First Nothing <> First Nothing = First Nothing
First (Just 5) <> First Nothing = First (Just 5)
First (Just 10) <> First (Just 55) = First (Uust 10)


Map a -> 3 <> Map a -> 5 = Map a -> 3

Map a -> First 3 <> Map a -> First 5 = Map a -> (First 3 <> First 5) = Map a -> First 3
