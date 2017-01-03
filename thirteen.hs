{-
(*) (Just 1) (Just 2)
(*) <$> (Just 1) -- <*> (Just 2)
Just (*1) <*> (Just 2)
-}

data Nullable a = Value a | Null deriving (Show)

instance Functor Nullable where
  fmap f (Value a) = Value (f a)
  fmap _ Null = Null

instance Applicative Nullable where
  pure = Value

  (<*>) (Value f) a = fmap f a
  (<*>) _ _ = Null

instance Monad Nullable where
  (>>=) Null _ = Null
  (>>=) (Value a) f = f a

half :: Int -> Nullable Int
half x = if x `mod` 2 == 0 then Value (x `div` 2) else Null

-- (>>=) 

-- half (half 20)

data List a = Empty | Cons a (List a) deriving (Show)

instance Functor List where
  fmap _ Empty = Empty
  fmap f (Cons head tail) = Cons (f head) (fmap f tail)

instance Monoid (List a) where
  mempty = Empty
  Empty `mappend` x = x
  (Cons head tail) `mappend` x = Cons head (tail `mappend` x)

instance Applicative List where
  pure x = Cons x Empty
  (Cons f tail) <*> x = fmap f x `mappend` (tail <*> x)
  Empty <*> x = Empty

instance Monad List where
  (>>=) Empty _ = Empty
  (>>=) (Cons head tail) f = f head `mappend` (tail >>= f)

halfTwice :: Int -> Nullable Int
halfTwice x = do
  x' <- half x
  half x'

-- [1,2,3] [4,5,6]
-- [(1,4),(1,5),(1,6)]
-- [1,2,3] >>= (x -> [4,5,6] >>= (y -> (x,y)))
cartesianProduct :: [a] -> [b] -> [(a,b)]
-- cartesianProduct xs ys = xs >>= (\x -> ys >>= (\y -> [(x,y)]))
cartesianProduct xs ys = do
  x <- xs
  y <- ys
  pure (x,y)

cartesianProduct' xs ys = [ (x,y) | x <- ys, y <- ys]

-- getLine :: IO String

main :: IO ()
main = do
  str <- getLine
  putStrLn str