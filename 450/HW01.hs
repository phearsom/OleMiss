{- 
	Gregory Phillips
	CSCI 450 
	HW01.hs

	#includes the following functions:
	-- prodSqSmall
	-- xor
	-- implies
	-- ccArea
	-- addTax
	-- subTax
	-- validDay
	-- roman
-}

module HW01
   (
	prodSqSmall, xor, implies, ccArea, addTax, subTax
    )

where

-- prodSqSmall
-- Given 3 doubles, take smallest 2, square and then multiply

prodSqSmall :: Double -> Double -> Double -> Double
prodSqSmall a b c  
 |  b <= a = prodSqSmall b a c
 |  c <= b = prodSqSmall a c b
 | otherwise = (a^2)*(b^2)

 
-- xor
-- Takes 2 Booleans and returns Exclusive-or values

xor :: Bool -> Bool -> Bool
xor a b  = if a == b then False else True 
 

-- implies
-- Develop a Haskell Boolean function implies that takes two Booleans p and q and returns the Boolean result p \Rightarrow q (i.e. logical implication). That is, if p is True and q is False, then the result is False; otherwise, the result is True.

implies :: Bool -> Bool -> Bool 
implies  a b 
  | a == True && b == True = True
  | otherwise = False

-- ELIFP Ch. 5, Ex. 7
-- Started using Template build out here. 
ccArea :: Double -> Double -> Double
ccArea a b 
  | a < 0 || b < 0 = error ""
  | a < b = ccArea b a
  | otherwise = ((a/2)^2 * pi) - ((b/2)^2 * pi) 
    
-- ELIFP Ch. 5, Ex. 9
-- Consider the equation:  addTax c p = ct
addTax :: Double -> Double -> Double
addTax a b 
  | a < 0 || b < 0  = error ""
  | otherwise = ((a * b) /100) + a

subTax :: Double -> Double -> Double
subTax a b 
  | a < 0 || b < 0 = error ""
  | otherwise = (a / (1 + ( b /100)))

-- ELIFP Ch. 5, Ex.11

-- Using proleptic Gregorian calendar, which underlies ISO 8601 standard
-- (month, day, year)
feb :: (Int,Int,Int) -> Bool
feb (m,d,y)
  | y mod 2 == 1 = d <= 28
  | y mod 400 == 0 = d <= 29
  | y mod 100 == 0 = d <= 28
  

  
validMonth :: (Int, Int, Int) -> Bool
validMonth (m,d,y)
  | m == 2 = feb (m,d,y)
  | otherwise = True

validDay :: (Int,Int,Int) -> Bool
validDay (m,d,y) 
  | m < 0 || m > 12 = error
  | d < 28 || d > 31 = error
  

-- -- ELIFP Ch. 5, Ex. 12
-- -- Roman numerals in range [0-3999], where 0 represented as empty string
-- roman :: Int -> String