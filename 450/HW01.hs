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
  | y `mod` 400 == 0  = d <= 29
  | y `mod` 100 ==0 = d <= 28
  | y `mod` 4 == 0  = d <= 29
  | otherwise = False
  -- | y `mod` 400 == 0 = d <= 29
  -- | y `mod` 100 == 0 = d <= 28
  -- | y `mod` 2 == 0 = d <= 28
  
checkMonth :: (Int,Int) -> Bool
checkMonth (m,d)
  | m == 1 || m == 3 || m == 5 || m == 7 || m == 8 || m == 10 || m == 12 = d <= 31
  | m == 4 || m == 6 || m == 9 || m == 11 = d <= 30

validMonth :: (Int, Int, Int) -> Bool
validMonth (m,d,y)
  | m == 2 = feb (m,d,y)
  | otherwise = checkMonth (m,d)

validDay :: (Int,Int,Int) -> Bool
validDay (m,d,y) 
  | m < 0 || m > 12 = error ""
  | d < 0 || d > 31 = error ""
  | y < 1 = error "Before Gregorian Calendar"
  | otherwise = validMonth (m,d,y)
  

-- -- ELIFP Ch. 5, Ex. 12
romanHelper1000 :: Int -> String
romanHelper1000 x
  | x - 1000 >= 0 =  ['M'] ++ romanHelper1000 (x-1000)
  | x - 900 >= 0 = ['C'] ++ ['M'] ++  romanHelper1000 (x-900) 
  | x - 500 >= 0 =  ['D'] ++  romanHelper1000 (x-500)
  | x - 400 >= 0 =  ['C'] ++ ['D'] ++  romanHelper1000 (x-400)
  | x - 100 >= 0 =  ['C'] ++ romanHelper1000 (x-100) 
  | x - 90 >= 0 =  ['X'] ++ ['C'] ++ romanHelper1000 (x-90) 
  | x - 50 >= 0 =  ['L'] ++ romanHelper1000 (x-50) 
  | x - 40 >= 0 =  ['X'] ++ ['L'] ++ romanHelper1000 (x-40) 
  | x - 10 >= 0 = ['X'] ++ romanHelper1000 (x-10)
  | x - 9 >= 0 =  ['I'] ++ ['X']  ++ romanHelper1000 (x-9) 
  | x - 5 >= 0 =  ['V'] ++ romanHelper1000 (x-5) 
  | x - 4 >= 0 =  ['I']  ++ ['V'] ++ romanHelper1000 (x-4) 
  | x - 1 >= 0 = ['I'] ++ romanHelper1000 (x-1) 
  | otherwise = ""


  -- -- Roman numerals in range [0-3999], where 0 represented as empty string
roman :: Int -> String
roman x
  | x <= 0  || x > 3999 = error ""
  | x >= 1000 = romanHelper1000 x
 
