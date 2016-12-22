import Data.Char

file :: Maybe String
file = Just "sattar"

fileNotExisting :: Maybe String
fileNotExisting = Nothing

uppercase :: Maybe String -> Maybe String
uppercase = fmap (map toUpper)

lowercase :: Maybe String -> Maybe String
lowercase = fmap (map toLower)

toUpperStr :: String -> String
toUpperStr = map toUpper


data Nullable a = Value a | Null deriving (Show)

instance Functor Nullable where
  fmap f (Value a) = Value (f a)
  fmap _ Null = Null

instance Applicative Nullable where
  pure = Value
  (<*>) (Value f) v = fmap f v
  (<*>) Null _ = Null