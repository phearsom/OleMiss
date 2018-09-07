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
     prodSqSmall, xor, implies     
    )

where

-- prodSqSmall
-- Given 3 doubles, take smallest 2, square and then multiply

prodSqSmall :: (Double,Double,Double) -> Double
prodSqSmall (a,b,c) 
 |  b < a = prodSqSmall(b,a,c)
 |  c < b = prodSqSmall(a,c,b)
 | otherwise = (a^2)*(b^2)

 
-- xor
-- Takes 2 Booleans and returns Exclusive-or values

xor :: (Bool,Bool) -> Bool
xor (a,b) = if a == b then False else True 
 

-- implies
-- Develop a Haskell Boolean function implies that takes two Booleans p and q and returns the Boolean result p \Rightarrow q (i.e. logical implication). That is, if p is True and q is False, then the result is False; otherwise, the result is True.

implies :: (Bool,Bool) -> Bool 
implies (a,b) 
  | a == True && b == True = True
  | otherwise = False


 
