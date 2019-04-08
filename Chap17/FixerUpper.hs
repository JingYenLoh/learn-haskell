module Chap17.FixerUpper where

foo = const <$> Just "Hello" <*> pure "World"

bar =
  (,,,) <$> Just 90
        <*> Just 10
        <*> Just "Tierness"
        <*> pure [1, 2, 3]
