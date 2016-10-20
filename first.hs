a :: Double
a = 1

list :: String
list = "Sattar"

inc :: Double -> Double
inc x = x + 1

add :: Int -> Int -> Int
add a b = a + b

{-
fib :: Int -> Int
fib n = if(n == 0 || n == 1) then
          1
        else
          fib (n-1) `add` fib (n-2)
          -}

fib :: Int -> Int
fib 0 = 1
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

first :: [Int] -> Int
first (x:_) = x















