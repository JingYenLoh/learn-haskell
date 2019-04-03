{-# LANGUAGE RankNTypes #-}

module Chap16.RankNTypes where

type Nat f g = forall a . f a -> g a
