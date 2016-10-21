#Problems

##Day 1

1. rest: takes a list and returns all the elements except the first element
2. last: takes a list and returns the last element
3. count: takes a list and returns length of list
4. elemAt: takes a list, an index and returns the element at that position e.g. elemAt 4 [1,2,3,4,5] = 5
5. take: takes a list, a number and returns that many elements from the list. e.g. take 3 [1,2,3,4,5] = [1,2,3]ii
6. drop: takes a list, a number and returns the list without that many elements from the list. e.g. drop 3 [1,2,3,i4,5] = [4,5]

##Day 2
1. Create a function `zipWith` that takes two lists and returns a tuple with elements from both the lists: `zipWith [1,2,3] ['a','b','c'] = [(1,'a'),(2,'b'),(3,'c')]`
2. Create a function `second` that gives you the second element of a tuple
3. Create a function `curry` that takes function of type: `(Int,Int) -> Int` and returns a function in curried form: `Int -> Int -> Int`. So, if I say call `curry addTuples`, the result should be `add` where `addTuple = \(a,b) -> a + b` and `add = \a b -> a + b`.
4. Create a function `uncurry` that does the opposite of above.
5. Create a function `flip` that flips the arguments. If `subtract x y = x - y`, then `flip subtract` should be the equivalent of `subtract x y = y - x`.
6. Create a function `subtract` that does subtraction. Subtract 2 from all numbers in a list using `map` and the `subtract`. First try it using anonymous functions and then try to use the `flip` defined above. Return a curried function.
7. Create a list of functions: `list :: [(Int -> Int)]`. Put whatever functions you need.
8. Apply composition over all the elements in the above list and return one function.
