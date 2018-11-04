{-
  Gregory Phillips
  10678899 
  CandyBowl.hs
-}





module CandyBowl_list
( CandyBowl(..), newBowl, isEmpty, putIn, has, size, howMany, eqBowl, takeOut, combine , inventory
)
where

-- Used in instructor solution
import Data.List ( sort, group, (\\) )

-- Candy bowl data representation
data CandyBowl a = Bowl [a] deriving Show

-- Exercise #1
newBowl :: CandyBowl a
newBowl = Bowl[]

-- Exercise #2
isEmpty :: CandyBowl a -> Bool
isEmpty (Bowl candy) = null candy

-- Exercise #3
putIn :: CandyBowl a -> a -> CandyBowl a
putIn (Bowl bowl) candy = Bowl(candy:bowl)

-- Exercise #4
-- Resource used: https://www.programming-idioms.org/idiom/12/check-if-list-contains-a-value
has :: Eq a => CandyBowl a -> a -> Bool
has (Bowl []) candy = False
has (Bowl candy) a = a `elem` candy

-- Exercise #5
size :: CandyBowl a -> Int
size (Bowl candy) = length candy

-- Exercise #6
-- Resource used: https://codereview.stackexchange.com/questions/139587/count-occurrences-of-an-element-in-a-list
howMany :: Eq a => CandyBowl a -> a -> Int
howMany (Bowl candy) x = sum $ map (\a -> 1) $ filter (== x) candy

-- Exercise #7
takeOut :: (Eq a) => CandyBowl a -> a -> Maybe (CandyBowl a)
takeOut (Bowl []) xs = Nothing
takeOut (Bowl candy@(x:a)) b
  | (has(Bowl candy) b) == False = Nothing
  | otherwise = Just (Bowl(iterateP candy b))

iterateP :: Eq a => [a] -> a -> [a]
iterateP [] a = []
iterateP q@(a:b) p
  | a == p = b
  | otherwise = a:(iterateP b p)

-- Exercise #8
eqBowl :: Ord a => CandyBowl a -> CandyBowl a -> Bool
eqBowl (Bowl x) (Bowl y) = sort x == sort  y

-- Exercise #9
inventory :: Ord a => CandyBowl a -> [(a, Int)]
inventory (Bowl []) = []
inventory (Bowl b) = map (\l@(x:xs) -> (x,length l)) . group . sort $ b  

-- Exercise #11
combine :: CandyBowl a -> CandyBowl a -> CandyBowl a
combine (Bowl []) (Bowl []) = (Bowl [])
combine (Bowl x) (Bowl []) = (Bowl x)
combine (Bowl []) (Bowl y) = (Bowl y)
combine (Bowl x) (Bowl y) = (Bowl (x++y))