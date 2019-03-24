{-# LANGUAGE RankNTypes #-}
{-# LANGUAGE TypeApplications #-}
{-# LANGUAGE DataKinds #-}
{-# LANGUAGE TypeInType #-}
{-# LANGUAGE TypeFamilies #-}
{-# LANGUAGE TypeOperators #-}
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
-- of the Dependent Product defined in the HoTT book
----------------------------------------------------------------------------
module Math.Dependent.Product
( prod_recursor
, pi1
, pi2
, uniq
  -- * optics
, isoProduct
) where


import Control.Lens

import Math.Dependent.Refl

------------------------------------------------------------------------------
-- Product types
------------------------------------------------------------------------------

-- | The recursion principle associated with product types.
--
-- @
-- f(x, y) := g x y for f: A x B -> C, and g: A -> B -> C
-- prod_recursor (\a b -> a) ~ π1
-- prod_recursor (\a b -> b) ~ π2
-- @
--
-- >>> pi1 (1, 'a')
-- 1
--
-- >>> pi2 (1, 'a')
-- a
prod_recursor
    :: forall a b c
    . (a -> b -> c) -> (a, b) -> c
prod_recursor g (a,b) = g a b

-- | the projector for the first element of a pair
pi1 :: (a, b) -> a
pi1 = prod_recursor (\a _ -> a)

-- | the projector for the second element of a pair
pi2 :: (a, b) -> b
pi2 = prod_recursor (\_ b -> b)

-- | haskell's type system has been defined this way
-- so the function 'uniq` is trivially 'Refl' given
-- a witness to type equality p ~ (a,b)
uniq
  :: (p ~ (a,b))
  => ((a,b) :~: p)
uniq = Refl

-- | Isomorphisms are also trivial given a witness to
-- the type equality x ~ (a,p) - notice that the
-- isomorphism is just id
isoProduct
  :: (x ~ (a,b))
  => Iso' (a,b) x
isoProduct = iso id id
