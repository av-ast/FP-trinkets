-- Trivial genetic algorithm example

module Main where

import Random
import Data.List

population = 10 :: Int
generations = 10 :: Int

-- split all population to more and less adapted to survival
middleSplit :: [a] -> ([a], [a])
middleSplit xs = splitAt (ceiling(genericLength(xs)/2)) xs

-- replace less adapted individuals with more adapted ones. Less adapted are dieing
replace :: ([a], [a]) -> [a]
replace ([],[]) = []
replace ([],l2) = l2 ++ l2
replace (l1,[]) = replicate population (last l1)
replace (l1,l2) = l2 ++ case (ll1 > ll2) of
                            True  -> l2 ++ take (ll1 - ll2) rl1
                            False -> case (ll1 < ll2) of
                                        True  -> take (ll2-ll1) rl1 
                                        False -> l2
                  where
                        ll1 = length l1
                        ll2 = length l2
                        rl1 = reverse l1

mutation :: Int -> IO Int
mutation el = do
    r <- randomRIO (0, 1 :: Double)
    return (if(r>0.5) then el+1 else el-1)

iter :: Int -> ([Int] -> IO([Int])) -> ([Int] -> [Int]) -> [Int] -> IO()
iter 0 _ _ _ = putStrLn "End."
iter counter fMut fGen xs = do
    print xs
    res <- fMut xs
    iter (counter-1) fMut fGen (fGen res)

main :: IO ()
main = iter generations (mapM mutation) (replace.middleSplit.sort) [0|_<-[1..population]]
