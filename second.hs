a = 1
str :: [Char]
str = "sattar"

fact :: Int -> Int
fact n = if (n == 0) then 1
         else n * fact (n-1)

fact' :: Int -> Int
fact' n = case n of
         0 -> 1
         _ -> n * fact'(n-1)

fact'' :: Int -> Int
fact'' 0 = 1
fact'' n = n * fact''(n-1)

-- fibonacci
fibo :: Int -> Int
fibo 0 = 1
fibo 1 = 1
fibo n = fibo (n-1) + fibo (n-2)

first :: [Int] -> Int
first (x:_) = x

rest :: [Int] -> [Int]
rest (_:xs) = xs

size :: [Int] -> Int
size [] = 0
size (x:xs) = 1 + size(xs)
map' :: (Int -> Int) -> [Int] -> [Int]
map' _ [] = []
map' f (x:xs) = (f x) : map' f xs

add' :: (Int, Int) -> Int
add' (x,y) = x + y

add :: Int -> (Int -> Int)
add = \x ->
         \y -> x + y

firstTuple :: (Int, Int) -> Int
firstTuple (x,_) = x

subArray :: Int -> Int -> [Int] -> [Int]
subArray x y = take (y-x) . (drop x)

quadruple :: Int -> Int
quadruple x = double (double x)
  

double :: Int -> Int
double = (*2)

square = (^2)

power4 :: Int -> Int
power4 x = square (square x)

applyTwice :: (Int -> Int) -> Int -> Int
applyTwice f x = f (f x)


o :: (Int -> Int) -> (Int -> Int) -> Int -> Int
o f g x = f (g x)

doubleAndSquare :: Int -> Int
doubleAndSquare = square . double

squareAndDouble :: Int -> Int
squareAndDouble = double . square







