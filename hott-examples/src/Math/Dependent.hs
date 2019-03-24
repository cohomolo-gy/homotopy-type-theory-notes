{-# LANGUAGE CPP #-}
-----------------------------------------------------------------------------
-- |
-- Module      :  Math.Dependent
-- Copyright   :  (c) 2019 Emily Pillmore
-- License     :  BSD-style (see the file LICENSE)
-- Maintainer  :  Emily Pillmore <emilypi@cohomolo.gy>
-- Stability   :  experimental
-- Portability :  non-portable
--
----------------------------------------------------------------------------
module Math.Dependent
( module Math.Dependent.Sum
, module Math.Dependent.Product
, module Math.Dependent.Refl
, module Math.Dependent.Natural
, module Math.Dependent.Pair
, module Math.Dependent.Unit
) where

import Math.Dependent.Sum
import Math.Dependent.Product
import Math.Dependent.Refl
import Math.Dependent.Natural
import Math.Dependent.Pair
import Math.Dependent.Unit

#ifdef HLINT
{-# ANN module "HLint: ignore Use import/export shortcut" #-}
#endif
