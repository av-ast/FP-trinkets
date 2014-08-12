permutations :: [Char] -> [[Char]]
permutations [] = [[]]
permutations word = [(x:xs) | x <- word, xs <- permutations $ filter (/= x) word]
