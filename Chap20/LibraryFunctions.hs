module Chapter20 where

import Data.Monoid

main :: IO ()
main = undefined

sum :: (Foldable t, Num a) => t a -> a
sum = getSum . foldMap Sum

product :: (Foldable t, Num a) => t a -> a
product = getProduct . foldMap Product

elem :: (Foldable t, Eq a) => a -> t a -> Bool
elem x = getAny . foldMap (Any . (==x))

minimum :: (Foldable t, Ord a) => t a -> Maybe a
minimum = foldr f Nothing
  where f a Nothing = Just a
        f a (Just b) = Just (if a < b then a else b)

maximum :: (Foldable t, Ord a) => t a -> Maybe a
maximum = foldr f Nothing
  where f a Nothing = Just a
        f a (Just b) = Just (if a > b then a else b)

null :: (Foldable t) => t a -> Bool
null = foldr (\_ _ -> False) True

length :: (Foldable t) => t a -> Int
length = foldr (\_ c -> c + 1) 0

toList :: (Foldable t) => t a -> [a]
toList = foldMap pure

fold' :: (Foldable t, Monoid m) => t m -> m
fold' = foldMap id
