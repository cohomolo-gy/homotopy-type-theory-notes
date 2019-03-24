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
module Math.Dependent.Pair
(  -- * types
  Σ
, B
)where



import Data.Kind

type Constant a = a
type family B a :: Type
type instance B (Constant a) = a

type family Σ a (b :: B a) :: Type

data Sigma (a :: Bool) t u where
  InL :: t -> Sigma 'True t u
  InR :: u -> Sigma 'False t u

instance (Show t, Show u) => Show (Sigma a t u) where
  show (InL t) = "InL " <> show t
  show (InR u) = "InR " <> show u
