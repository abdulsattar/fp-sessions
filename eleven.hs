{-# LANGUAGE FlexibleInstances #-}

class Functor f => AAplicative f where
  apply :: f (a -> b) -> f a -> f b
  pureAApplicative :: a -> f a

data Nullable a = Value a | Null deriving (Show)
instance Functor Nullable where
  fmap f (Value a) = Value (f a)
  fmap _ Null = Null

instance AAplicative Nullable where
  pureAApplicative = Value

  apply (Value f) a = fmap f a
  apply _ _ = Null

class MMonoid f where
	uunit :: f
	mmappend :: f -> f -> f

instance MMonoid Int where
  uunit = 0
  mmappend = (+)

instance MMonoid String where
	uunit = []
	mmappend = (++)

-- sum :: [Int] -> Int
-- sum [] = 0
-- sum (x:xs) = x + sum xs

mmsum :: MMonoid m => [m] -> m
mmsum [] = uunit
mmsum (x:xs) = x `mmappend` mmsum xs