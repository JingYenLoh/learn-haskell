module Chap18.Scratch where

import Control.Monad (join)
import Data.List

-- join :: Monad m => m (m a) -> m a
-- fmap :: Functor m => (a -> b) -> m a -> m b
bind :: Monad m => (a -> m b) -> m a -> m b
bind f ma = join $ fmap f ma

sequencing :: IO ()
sequencing = do
  putStrLn "blah"
  putStrLn "another thing"

sequencing' :: IO ()
sequencing' =
  putStrLn "blah" *>
  putStrLn "another thing"

sequencing'' :: IO ()
sequencing'' =
  putStrLn "blah" >>
  putStrLn "another thing"

binding :: IO ()
binding = do
  name <- getLine
  putStrLn name

binding' :: IO ()
binding' = getLine >>= putStrLn

bindingAndSequencing :: IO ()
bindingAndSequencing = do
  putStrLn "name pls:"
  name <- getLine
  putStrLn $ "y helo thar: " ++ name

bindingAndSequencing' :: IO ()
bindingAndSequencing' =
  putStrLn "name pls:" >>
  getLine >>=
    \name ->
        putStrLn $ "y helo thar: " ++ name

twoBinds :: IO ()
twoBinds = do
  putStrLn "name pls:"
  name <- getLine
  putStrLn "age pls:"
  age <- getLine
  putStrLn $ "y helo thar: "
    ++ name ++ " who is: "
    ++ age ++ " years old."

twoBinds' :: IO ()
twoBinds' =
  putStrLn "name pls:" >>
  getLine >>=
  \name -> putStrLn "age pls:" >>
  getLine >>=
  \age -> putStrLn $ "y helo thar: "
    ++ name ++ " who is: "
    ++ age ++ " years old."

twiceWhenEven :: [Integer] -> [Integer]
twiceWhenEven xs = do
  x <- xs
  if even x
    then [x*x, x*x]
    else [x*x]

twiceWhenEven' :: [Integer] -> [Integer]
twiceWhenEven' xs = do
  x <- xs
  if even x
    then [x*x, x*x]
    else []

data Cow = Cow { name  :: String
               , age   :: Int
               , weight :: Int }
         deriving (Eq, Show)

noEmpty :: String -> Maybe String
noEmpty "" = Nothing
noEmpty xs = Just xs

noNegative :: Int -> Maybe Int
noNegative n
  | n >= 0 = Just n
  | otherwise = Nothing

weightCheck :: Cow -> Maybe Cow
weightCheck cow =
  let w = weight cow
      n = name cow
  in if n == "Bess" && w > 499
  then Nothing
  else Just cow

mkSphericalCow :: String
               -> Int
               -> Int
               -> Maybe Cow
mkSphericalCow name' age' weight' =
  case noEmpty name' of
    Nothing -> Nothing
    Just name ->
      case noNegative age' of
        Nothing -> Nothing
        Just age ->
          case noNegative weight' of
            Nothing -> Nothing
            Just weight ->
              weightCheck (Cow name age weight)

mkSphericalCow' :: String
                -> Int
                -> Int
                -> Maybe Cow
mkSphericalCow' name' age' weight' = do
  name <- noEmpty name'
  age <- noNegative age'
  weight <- noNegative weight'
  weightCheck $ Cow name age weight

mkSphericalCow'' :: String
                 -> Int
                 -> Int
                 -> Maybe Cow
mkSphericalCow'' name' age' weight' =
  noEmpty name' >>= \name ->
  noNegative age' >>= \age ->
  noNegative weight' >>= \weight ->
  weightCheck $ Cow name age weight

mkSphericalCow''' :: String
                  -> Int
                  -> Int
                  -> Maybe Cow
mkSphericalCow''' name' age' weight' =
  weightCheck =<<
        Cow <$> noEmpty name'
        <*> noNegative age'
        <*> noNegative weight'

f :: Integer -> Maybe Integer
f 0 = Nothing
f n = Just n

g :: Integer -> Maybe Integer
g i =
  if even i
  then Just (i+1)
  else Nothing

h :: Integer -> Maybe String
h i = Just $ "10191" ++ show i

doSomething' :: Integer -> Maybe (Integer, Integer, String)
doSomething' n = do
  a <- f n
  b <- g a
  c <- h b
  pure (a, b, c)
