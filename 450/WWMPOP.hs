{- 
	Gregory Phillips
	CSCI 450 
	WWMPOP.hs

	#includes the following functions:
	
-}

module WWMPOP
   (
   
    )
type BarCode = Int
type Price = Int
type Name = String
type PriceList = [(BarCode,Name,Price)]

database :: PriceList
database = [ (1848, "Vanilla yogurt cups (4)", 188),
(1620, "Ground turkey (1 lb)", 316),
(1492, "Corn flakes cereal", 299),
(1773, "Black tea bags (100)", 307),
(2525, "Athletic socks (6)", 825),
(9595, "Claw hammer", 788),
(1945, "32-in TV", 13949),
(1066, "Zero sugar cola (12)", 334),
(2018, "Haskell programming book", 4495)
]

type CartItems = [BarCode]
type CartPrices = [(Name,Price)]
type Bill = (CartPrices, Price, Price, Price)


priceCart :: PriceList -> CartItems -> CartPrices



makeBill :: CartPrices -> Bill


taxRate :: Double
taxRate = 0.07

formatBill :: Bill -> String


lineWidth :: Int
lineWidth = 34

makeReceipt :: PriceList -> CartItems -> String

formatDollars :: Price -> String

formatLine :: (Name, Price) -> String

formatLines :: CartPrices -> String

calcSubtotal :: CartPrices -> Price

formatAmt :: String -> Price -> String

formatBill :: Bill -> String


look :: PriceList -> BarCode -> (Name,Price)


priceCart :: PriceList -> CartItems -> CartPrices

makeBill :: CartPrices -> Bill

makeReceipt :: PriceList -> CartItems -> String


addPL :: PriceList -> BarCode -> (Name,Price)
-> PriceList
removePL :: PriceList -> BarCode -> PriceList


