{- 
	Gregory Phillips
	CSCI 450 
	WWMPOP.hs

	#includes the following functions:
	
-}

module WWMPOP
   (
   
	)

	where 

type BarCode = Int
type Price = Int
type Name = String
type PriceList = [(BarCode,Name,Price)]

database :: PriceList
database = [ 
	(1848, "Vanilla yogurt cups (4)", 188),
	(1620, "Ground turkey (1 lb)", 316),
	(1492, "Corn flakes cereal", 299),
	(1773, "Black tea bags (100)", 307),
	(2525, "Athletic socks (6)", 825),
	(9595, "Claw hammer", 788),
	(1945, "32-in TV", 13949),
	(1066, "Zero sugar cola (12)", 334),
	(2018, "Haskell programming book", 4495)]

type CartItems = [BarCode]
type CartPrices = [(Name,Price)]
type Bill = (CartPrices, Price, Price, Price)


priceCart :: PriceList -> CartItems -> CartPrices
priceCart x (y:ys) =
	let first = look y
	    rest = priceCart x ys
		in first ++ rest
		

makeBill :: CartPrices -> Bill
makeBill x = [lookup' item | item <- x]


taxRate :: Double
taxRate = 0.07

formatBill :: Bill -> String
formatBill [] = []
formatBill ((xs,y):xss ) = 
	let formatLn  = formatLines (xs,y)
	    getTotal = calcSubtotal ((xs,y): xss)
	    total = formatAmt getTotal 
		in formatLn ++ total

lineWidth :: Int
lineWidth = 34

makeReceipt :: PriceList -> CartItems -> String
makeReceipt x y = undefined

formatDollars :: Price -> String

formatDollars x = 
	let dollars = x `div` 100
	    cents   = x `mod` 100
			in show dollars ++ "." ++ (fixPenny . show) cents

fixPenny :: String -> String
fixPenny xs
	| length xs < 2 = '0':xs
	| otherwise = xs

formatLine :: (Name, Price) -> String
formatLine (x,y) = 
	let amount = formatDollars y
	    amountLen =  length amount
	    nameLen = length x
	    dots = lineWidth - (amountLen - nameLen)
	    dot = "."
	    print = concat $ replicate dots dot
	    newLine = "\n"
		in id(x ++ print ++ amount ++ newLine)

formatLines :: CartPrices -> String
formatLines [] = []
formatLines ((xs,y) : xss) = 
	let first = formatLine ((xs,y))
	    rest = formatLines(xss)
		in first ++ rest

calcSubtotal :: CartPrices -> Price
calcSubtotal ((xs,y) : xss) = y + calcSubtotal xss

formatAmt :: String -> Price -> String
formatAmt x y = formatLine (x,y)



look :: PriceList -> BarCode -> (Name,Price)
look dataBase barCode 
  | null miss = ("None", 0)
  | otherwise = head miss
		where miss = [(n,p) | (b,n,p) <-database, b == barCode]

lookup' :: BarCode -> (Name, Price)
lookup' x = look database x



{--
addPL :: PriceList -> BarCode -> (Name,Price)-> PriceList
addPl x = x

removePL :: PriceList -> BarCode -> PriceList
removePl x = x

--}
