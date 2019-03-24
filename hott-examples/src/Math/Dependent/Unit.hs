{-# LANGUAGE GADTs #-}
{-# LANGUAGE TypeOperators #-}
{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE MultiParamTypeClasses #-}
{-# LANGUAGE TypeInType #-}
{-# LANGUAGE StandaloneDeriving #-}
{-# LANGUAGE UnicodeSyntax #-}
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
-- of the Unit type 𝟙
----------------------------------------------------------------------------
module Math.Dependent.Unit ( unit_recursor ) where


unit_recursor :: forall c. c -> () -> c
unit_recursor c _ = c
