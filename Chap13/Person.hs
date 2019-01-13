-- |

module Chap13.Person where

type Name = String
type Age = Integer

data Person = Person Name Age deriving Show

data PersonInvalid = NameEmpty
                   | AgeTooLow
                   | PersonInvalidUnknown String
                   deriving (Eq, Show)

mkPerson :: Name
         -> Age
         -> Either PersonInvalid Person
mkPerson name age
  | name /= "" && age > 0 = Right $ Person name age
  | name == ""            = Left NameEmpty
  | not (age > 0)         = Left AgeTooLow
  | otherwise             =
      Left $ PersonInvalidUnknown $
        "Name was: " ++ show name ++
        " Age was: " ++ show age

gimmePerson :: IO ()
gimmePerson = do
  putStr "Type the person's name: "
  name <- getLine
  putStr "Type the person's age: "
  ageStr <- getLine
  let age = (read ageStr) :: Integer in
    case mkPerson name age of
      Right person ->
        putStrLn $ "yay! Successfully got a person. " ++ show person
      Left error ->
        putStrLn $ "An error occurred :( " ++ show error
  return ()
