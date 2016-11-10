squares :: [Int] -> [Int]
squares = map square
  where square x = x * x

sum' :: [Int] -> Int
sum' = foldl (\memo e -> memo + e) 0

filter' :: (Int -> Bool) -> [Int] -> [Int]
filter' f = foldr (\e memo -> if(f e) then e:memo else memo) []

--product' :: [Int] -> Int
--length' :: [Int] -> Int
and' :: [Bool] -> Bool
and' = foldl (\memo e -> memo && e) True

{-
and'' :: [Bool] -> Bool
and'' = foldr (\e memo -> memo && e) True
-}
