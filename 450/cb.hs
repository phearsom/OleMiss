{- 
	Gregory Phillips
	CSCI 450 
	CandyBowl.hs

	#includes the following functions:
	
-}

module CandyBowl
   (
       newBowl, isEmpty
    )
where

data CandyBowl a = Bowl [a] deriving Show


-- 1. newBowl
newBowl :: CandyBowl a
newBowl = Bowl []

-- 2. isEmpty
isEmpty ::module CandyBowl_list
( CandyBowl(..), newBowl, putIn, takeOut, isEmpty, size, howMany,
  has, eqBowl, inventory, restock, combine, difference, rename
)
where

-- Used in instructor solution
-- import Data.List ( sort, group, (\\) )

-- Candy bowl data representation
data CandyBowl a = Bowl [a] deriving Show

-- Remove comments from implemented type signatures below




isEmpty (Bowl xs)
  | length xs == 0 = True
  | otherwise = False

putIn :: CandyBowl a -> a -> CandyBowl a
putIn (Bowl xs) candy = Bowl(xs ++ [candy])


has :: CandyBowl a -> a -> Bool
has (Bowl xs) candy = True




-- Exercise #4
-- has :: Eq a => CandyBowl a -> a -> Bool

-- Exercise #5
-- size :: CandyBowl a -> Int

-- Exercise #6
-- howMany :: Eq a => CandyBowl a -> a -> Int

-- Exercise #7
-- takeOut :: (Eq a,Show a) => CandyBowl a -> a -> Maybe (CandyBowl a)

-- Exercise #8
-- eqBowl :: Ord a => CandyBowl a -> CandyBowl a -> Bool

-- Exercise #9                            
-- inventory :: Ord a => CandyBowl a -> [(a,Int)]

-- Exercise #10
-- restock :: [(a,Int)] -> CandyBowl a

-- Exercise #11
-- combine :: CandyBowl a -> CandyBowl a -> CandyBowl a

-- Exercise #12
-- difference :: Eq a => CandyBowl a -> CandyBowl a -> CandyBowl a

-- Exercise #13
-- rename :: CandyBowl a -> (a -> b) -> CandyBowl b CandyBowl a -> Bool