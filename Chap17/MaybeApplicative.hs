module Chap17.MaybeApplicative where

import Control.Applicative

newtype Name = Name String
             deriving (Eq, Show)
newtype Address = Address String
                deriving (Eq, Show)

data Person = Person Name Address
            deriving (Eq, Show)

validateLength :: Int -> String -> Maybe String
validateLength maxLen s =
  if (length s) > maxLen
  then Nothing
  else Just s

mkName :: String -> Maybe Name
mkName s =
  fmap Name $ validateLength 25 s

mkAddress :: String -> Maybe Address
mkAddress s =
  fmap Address $ validateLength 100 s

mkPerson :: String
         -> String
         -> Maybe Person
mkPerson n a =
  Person <$> mkName n <*> mkAddress a

data Cow = Cow {
  name   :: String
  , age    :: Int
  , weight :: Int
  } deriving (Eq, Show)

noEmpty :: String -> Maybe String
noEmpty "" = Nothing
noEmpty xs = Just xs

noNegative :: Int -> Maybe Int
noNegative x
  | x >= 0 = Just x
  | otherwise = Nothing

mkCow :: String
      -> Int
      -> Int
      -> Maybe Cow
mkCow name age weight =
  Cow <$> noEmpty name
      <*> noNegative age
      <*> noNegative weight

mkCow' :: String
       -> Int
       -> Int
       -> Maybe Cow
mkCow' name age weight =
  liftA3 Cow (noEmpty name)
             (noNegative age)
             (noNegative weight)
