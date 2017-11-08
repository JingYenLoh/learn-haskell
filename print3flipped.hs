-- print3flipped.hs
module Print3Flipped where

myGreeting :: String
myGreeting = (++) "Hello" " world!"

hello :: String
hello = "Hello"

world :: String
world = "world!"

main :: IO ()
main = do
  putStrLn myGreeting
  putStrLn secondGeeting
  where secondGeeting =
    -- this some Lisp ass shit
    (++) hello ((++) "" world)
-- could've been:
-- secondGreeting =
--   hello ++ " " ++ world