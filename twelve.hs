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