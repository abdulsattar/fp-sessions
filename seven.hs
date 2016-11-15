data Store = Store {
  rentals :: [Rental],
  bicycles :: [Bicycle],
  customers :: [Customer]
}

data Rental = Rental {
  bicycle :: Bicycle,
  customer :: Customer,
  startDate :: Int,
  endDate :: Maybe Int
}

data Bicycle = Bicycle {
  id :: Int,
  price :: Int
}

type Customer = String

isCompleted :: Rental -> Bool
isCompleted = (/= Nothing) . endDate
{-
isCompleted (Rental _ _ _ Null) = False
isCompleted _ = True
-}

availableBicycles :: Store -> [Bicycle]
availableBicycles (Store [] c _) = c
availableBicycles (Store _ [] _) = []
availableBicycles (Store rentals _ _) =
  map bicycle . filter (not . isCompleted) $ rentals

rent :: Store -> Bicycle -> Store
rent = undefined

return :: Store -> Bicycle -> Store
return = undefined

listEqual :: Eq a => [a] -> [a] -> Bool
listEqual [] [] = True
listEqual _ [] = False
listEqual [] _ = False
listEqual (x:xs) (y:ys) = x == y && listEqual xs ys

sort :: Ord a => [a] -> [a]
sort [] = []
sort (p:xs) = left ++ [p] ++ right
  where left  = sort . filter (<p) $ xs
        right = sort . filter (>=p) $ xs

{-
data Nullable a = Value a
                | Null deriving (Eq)

value :: Nullable a -> a
value Null = undefined
value (Value x) = x

compare' :: Comparable a => Nullable a -> Nullable a -> Bool
compare' Null _    = False
compare' _ Null    = False
compare' (Value x) (Value y) = x `equal` y

class Comparable a where
  equal :: a -> a -> Bool

instance Comparable Int where
  equal i j = i == j

--compare (Value 3) (Value 3)

data Boolean = TTrue
             | FFalse
             -}
