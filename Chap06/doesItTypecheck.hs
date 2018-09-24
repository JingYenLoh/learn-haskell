-- doesItTypecheck.hs
module DoesItTypecheck where

-- 1.
data Person = Person Bool deriving (Show)

printPerson :: Person -> IO ()
printPerson person = putStrLn (show person)

-- 2.
data Mood =
    Blah
  | Woot deriving (Show, Eq)

settleDown :: Mood -> Mood
settleDown x = if x == Woot
               then Blah
               else x

-- 3.
-- a) Woot or Blah
-- b) Error, Mood doesn't derive from Num so you can't compare 9 and Woot
-- a) Error, Mood doesn't derive from Ord

-- 4.
type Subject = String
type Verb    = String
type Object  = String

data Sentence =
  Sentence Subject Verb Object
  deriving (Eq, Show)

s1 = Sentence "dogs" "drool"         -- typechecks, but fails to print
s2 = Sentence "Julie" "loves" "dogs" -- typechecks

data Rocks =
  Rocks String deriving (Eq, Show)

data Yeah =
  Yeah Bool deriving (Eq, Show)

data Papu =
  Papu Rocks Yeah
  deriving (Eq, Show)

-- 1. Does not typecheck
-- phew = Papu "chases" True

-- 2. typechecks
truth = Papu (Rocks "chomskydoz")
            (Yeah True)

-- 3. typechecks, deriving Eq
equalityForall :: Papu -> Papu -> Bool
equalityForall p p' = p == p'

-- 4. does not typecheck, no instance of Ord
comparePapus :: Papu -> Papu -> Bool
comparePapus p p' = p > p'
