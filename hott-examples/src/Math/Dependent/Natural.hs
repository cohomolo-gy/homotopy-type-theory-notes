{-# LANGUAGE GADTs #-}
{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeInType #-}
{-# LANGUAGE StandaloneDeriving #-}
-----------------------------------------------------------------------------
-- |
-- Module      :  Math.Dependent
-- Copyright   :  (c) 2019 Emily Pillmore
-- License     :  BSD-style (see the file LICENSE)
-- Maintainer  :  Emily Pillmore <emilypi@cohomolo.gy>
-- Stability   :  experimental
-- Portability :
--
-- This module contains all of the exercises and fundamental definitions
-- of Propositional Equality as a relation and type
----------------------------------------------------------------------------
module Math.Dependent.Natural
( Nat(..)
, succ
, nat_recursor
, double
, add
, toInt
, fromInt
) where


import Prelude hiding (succ)


data Nat = Zero | Succ Nat deriving (Eq, Show, Ord)


succ :: Nat -> Nat
succ = Succ

nat_recursor
    :: forall a
    . a -> (Nat -> a -> a) -> Nat -> a
nat_recursor c0 cs = \case
  Zero -> c0
  Succ n -> nat_recursor (cs n c0) cs n

double :: Nat -> Nat
double = \case
  Zero -> Zero
  Succ n -> succ (succ (double n))

add :: Nat -> Nat -> Nat
add Zero n = n
add (Succ n) m = add n (succ m)

toInt :: Nat -> Int
toInt = nat_recursor 0 (\_ a -> 1+a)

fromInt :: Int -> Nat
fromInt i
  | i <= 0 = Zero
  | otherwise = Succ (fromInt (i-1))
