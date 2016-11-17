class Moveable a where
  move :: Int -> a -> a
--type Position = (Int, Int)
data Person = Person Int String Int
            | DeadPerson Int String Int
              deriving (Show, Eq, Ord)
instance Moveable Person where
  move dis (Person a n p) = Person a n (dis + p)
  move dis p = p


data Nullable a = Value a
                | Null deriving (Show, Eq)
inc :: Num a => a -> a
inc = (+1)

incNullable :: Num a => Nullable a -> Nullable a
incNullable Null = Null
incNullable (Value x) = Value . inc $ x

incList :: Num a => [a] -> [a]
incList [] = []
incList (x:xs) = (inc x) : (incList xs)
{-
class FFunctor f where
  ffmap :: (a -> b) -> f a -> f b

instance FFunctor Nullable where
  ffmap f Null = Null
  ffmap f (Value x) = Value . f $ x

incNullable' :: Num a =>  Nullable a -> Nullable a
incNullable' = ffmap inc

instance FFunctor [] where
  ffmap f [] = []
  ffmap f (x:xs) = (f x):(ffmap f xs)
-}
