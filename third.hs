second :: (Int, Int) -> Int
second (_,y) = y

zip' :: [Int] -> [Int] -> [(Int, Int)]
zip' [] _ = []
zip' _ [] = []
zip' (x:xs) (y:ys) = (x,y):zip xs ys

curry' :: ((Int,Int) -> Int) -> Int -> Int -> Int
curry' f = \x y -> f (x,y)
