-- enumFromTo.hs
module EnumFromTo where

eftBool :: Bool -> Bool -> [Bool]
eftBool False True = [False, True]
eftBool True False = error "Can't do that because in Haskell True > False"
eftBool y _        = [y]

eftOrd :: Ordering -> Ordering -> [Ordering]
eftOrd x y
  | x >  y    = error "The first argument must be smaller or equal to the second argument"
  | x == y    = [x]
  | otherwise = [x] ++ eftOrd (succ x) y

eftInt :: Int -> Int -> [Int]
eftInt lower upper = go lower upper []
  where go x y acc
          | x >  y    = error "The first argument must be smaller or equal to the second argument"
          | x == y    = acc ++ [y]
          | otherwise = (go (succ x) y (acc ++ [x]))

eftChar :: Char -> Char -> [Char]
eftChar start end = go start end []
  where go x y acc
          | x >  y    = error "The first argument must be smaller or equal to the second argument"
          | x == y    = acc ++ [y]
          | otherwise = (go (succ x) y (acc ++ [x]))

main :: IO ()
main = do
  putStrLn $ if (eftBool bool1 bool2) == [bool1..bool2]
             then "True"
             else "False"
  where
    bool1 = False
    bool2 = True