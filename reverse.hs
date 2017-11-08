-- reverse.hs
module Reverse where

-- x = "Curry is awesome"
-- "awesome is Curry"
rvrs :: String -> String
rvrs x = awesome ++ is ++ curry
  where
    awesome = drop 9 x
    is = take 4 $ drop 5 x
    curry = take 5 x