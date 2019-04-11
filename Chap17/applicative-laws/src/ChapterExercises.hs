module ChapterExercises where

import Control.Applicative (liftA3)

data Pair a = Pair a a

instance Functor Pair where
  fmap f (Pair a a1) = Pair (f a)(f a1)

instance Applicative Pair where
  pure a = Pair a a
  (Pair a a1) <*> (Pair b b1) = Pair (a b) (a1 b1)

data Two a b = Two a b
             deriving (Eq, Show)

instance Functor (Two a) where
  fmap f (Two a b) = Two a (f b)

instance Monoid a => Applicative (Two a) where
  pure = Two mempty
  (Two a b) <*> (Two a1 b1) = Two (a <> a1) (b b1)

data Three a b c = Three a b c
                 deriving (Eq, Show)

instance Functor (Three a b) where
  fmap f (Three a b c) = Three a b (f c)

instance (Monoid a, Monoid b) => Applicative (Three a b) where
  pure = Three mempty mempty
  (Three a b c) <*> (Three a1 b1 c1) =
    Three (a <> a1) (b <> b1) (c c1)

data Three' a b = Three' a b b
                deriving (Eq, Show)

instance Functor (Three' a) where
  fmap f (Three' a b b1) = Three' a (f b) (f b1)

instance Monoid a => Applicative (Three' a) where
  pure b = Three' mempty b b
  (Three' a b f) <*> (Three' a1 b1 f1) =
    Three' (a <> a1) (b b1) (f f1)

data Four a b c d = Four a b c d
                  deriving (Eq, Show)

instance Functor (Four a b c) where
  fmap f (Four a b c d) = Four a b c (f d)

instance (Monoid a, Monoid b, Monoid c)
        => Applicative (Four a b c) where
  pure = Four mempty mempty mempty
  (Four a b c d) <*> (Four a1 b1 c1 d1) =
    Four (a <> a1) (b <> b1) (c <> c1) (d d1)

data Four' a b = Four' a a a b
               deriving (Eq, Show)

instance Functor (Four' a) where
  fmap f (Four' a a1 a2 b) = Four' a a1 a2 (f b)

instance (Monoid a) => Applicative (Four' a) where
  pure = Four' mempty mempty mempty
  (Four' a b c d) <*> (Four' a1 b1 c1 d1) =
    Four' (a <> a1) (b <> b1) (c <> c1) (d d1)
