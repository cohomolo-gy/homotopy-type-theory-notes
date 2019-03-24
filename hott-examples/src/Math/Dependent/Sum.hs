{-# LANGUAGE LambdaCase #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeInType #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE GADTs #-}
-----------------------------------------------------------------------------
-- |
-- Module      :  Math.Dependent
-- Copyright   :  (c) 2019 Emily Pillmore
-- License     :  BSD-style (see the file LICENSE)
-- Maintainer  :  Emily Pillmore <emilypi@cohomolo.gy>
-- Stability   :  experimental
-- Portability :  RankNTypes, TypeApplications, TypeInType, TypeFamilies
--
----------------------------------------------------------------------------
module Math.Dependent.Sum
( -- * definitions
  sum_recursor
, inl
, inr
) where


-- | The recursion principle associated with sum types.
--
-- @
-- f (x + y) := g x + g y  for f: A + B -> C, and g: (A -> C) -> (B -> C) -> C
-- σ_recursor (\a b -> a) ~ σ1
-- σ_recursor (\a b -> b) ~ σ2
-- @
--
-- >>> σ1 $ Left 1
-- 1
--
-- >>> σ2 $ Right 'a'
-- a
sum_recursor
    :: forall a b c
      -- ^ take a destructor g : a -> b -> c, and a pair and produce a c
    . (a -> c) -> (b -> c) -> Either a b -> c
sum_recursor f g e = case e of
  Left a -> f a
  Right b -> g b

inl :: a -> Either a b
inl = Left

inr :: b -> Either a b
inr = Right
