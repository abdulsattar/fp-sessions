sum' :: [Int] -> Int
sum' [] = 0
sum' (x:xs) = (+) x (sum' xs)

foldl' :: (Int -> [Int] -> [Int]) -> [Int] -> [Int] -> [Int]
foldl' _ i [] = i
foldl' p i (x:xs) = p x (foldl' p i xs)

filter' p xs = foldl' f [] xs
  where f = \e memo -> if(p e) then e:memo else memo

head' (x:xs) = x

myFoldl :: (a -> b -> a) -> a -> [b] -> a
myFoldl f z xs = foldr step id xs z
    where step x g a = g (f a x)

count :: [Int] -> Int
count = foldr (\x memo -> memo + 1) 0

dup' :: [Int] -> [Int]
dup' = foldr (\e memo -> e:memo) []

reverse' :: [Int] -> [Int]
reverse' = foldl (\memo e -> e:memo) []

data Boolean = TTrue
             | FFalse deriving(Show)

and' :: Boolean -> Boolean -> Boolean
and' TTrue TTrue = TTrue
and' _ _ = FFalse

data BinaryTree = Node BinaryTree Int BinaryTree
                | Leaf Int deriving(Show)
postord :: BinaryTree -> [Int]
postord (Leaf i) = [i]
postord (Node l i r) = ((postord l)++(postord r))++[i]

data Gender = Male | Female | Other deriving(Show)

{-
data Person = Person String Gender Int deriving(Show)
name :: Person -> String
name (Person n _ _) = n

gender :: Person -> Gender
gender (Person _ g _) = g

age :: Person -> Int
age (Person _ _ a) = a
-}

data Person = Person { name :: String, gender :: Gender, age :: Int}

setAge :: Person -> Int -> Person
setAge (Person n g _) a = Person n g a
