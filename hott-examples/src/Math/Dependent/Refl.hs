{-# LANGUAGE GADTs #-}
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
module Math.Dependent.Refl
( -- * data
  (:~:)(..)
, (:~~:)(..)
  -- * the relation - note: reflexivity is vacuously true
, sym
, trans
) where

data a :~: b where
  Refl :: a :~: b
  deriving (Eq, Show, Ord)

sym :: a :~: b -> b :~: a
sym Refl = Refl

trans :: (a :~: b) -> (b :~: c) -> (a :~: c)
trans Refl Refl = Refl

data (a :: t) :~~: (b :: u) where
  HRefl :: a :~~: a

deriving instance Eq (a :~~: b)
deriving instance Show (a :~~: b)
deriving instance Ord (a :~~: b)
