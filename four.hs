doubles :: [Int] -> [Int]
doubles [] = []
doubles (x:xs) = x*2:doubles xs

triples :: [Int] -> [Int]
tripes [] = []
triples (x:xs) = x*3:triples xs

squares :: [Int] -> [Int]
squares [] = []
squares (x:xs) = x*x:squares xs

map' :: (Int -> Int) -> [Int] -> [Int]
map' _ [] = []
map' f (x:xs) = (:) (f x) (map' f xs)

sum' :: [Int] -> Int
sum' [] = 0
sum' (x:xs) = (+) x (sum xs)

count :: [Int] -> Int
count [] = 0
count (x:xs) = 1 + count xs

product' :: [Int] -> Int
product' [] = 1
product' (x:xs) = x*product' xs

reduce :: (Int -> Int -> Int) -> Int -> [Int] -> Int
reduce _ i [] = i
reduce f i (x:xs) = f x (reduce f i xs)

count'' = reduce (\x i -> 1 + i) 0
sum'' = reduce (\x i -> x + i) 0
product'' = reduce (\x i -> x * i) 1
--map'' f = reduce (\x i -> i ++ [f x]) []

{-
[1,2,3]
(+) 1 (sum [2,3])
(+) 1 ((+) 2 sum [3]))
(+) 1 ((+) 2 ((+) 3 (sum []))))
f 1 (f 2 (f 3 (i))))
-}

doubles' = map' (*2)
triples' = map' (*3)
squares' = map' (\x -> x * x)



{-
smallest :: [Int] -> Int
smallest = head . sort
-}
