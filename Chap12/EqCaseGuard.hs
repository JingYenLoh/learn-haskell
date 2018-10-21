-- EqCaseGuard.hs

module Chap12.EqCaseGuard where

type Name = String
type Age = Integer


data Person = Person Name Age deriving Show


data PersonInvalid
  = NameEmpty
  | AgeTooLow
  deriving (Eq, Show)


blah :: PersonInvalid -> String
blah pi
  | pi == NameEmpty = "NameEmpty"
  | pi == AgeTooLow = "AgeTooLow"
  | otherwise       = "???"


mkPerson :: Name -> Age -> Either PersonInvalid Person
mkPerson name age
  | name /= "" && age >= 0 =
    Right $ Person name age
  | name == "" = Left NameEmpty
  | otherwise = Left AgeTooLow
