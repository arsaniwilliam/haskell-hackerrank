-- https://www.hackerrank.com/challenges/filter-elements

module FilterElements where

import           Control.Monad (replicateM)
import           Data.List     (group, sort)
import           Data.Maybe    (listToMaybe, mapMaybe)
-- import Data.List.Split.Internals (chunksOf)

chunksOf :: Int -> [a] -> [[a]]
chunksOf = undefined

main :: IO ()
main = readProblem

readProblem :: IO ()
readProblem = getLine
  >>= flip replicateM getLine . (*2) . readInt
  >>= print . map readCase . chunksOf 2


readInt :: String -> Int
readInt = read

readCase :: [String] -> [Int]
readCase ins = filterElements (<k) ls where
    -- n = readInt . head . words . head $ ins
    k = readInt . (!!1) . words . head $ ins
    ls = map readInt . words . (!!1) $ ins


filterElements :: (Int -> Bool) -> [Int] -> [Int]
filterElements f = mapMaybe listToMaybe  . filter (f . length) . group . sort

data Result = ListResult [Int] | NotFound

instance Show Result where
    show (ListResult ls) = show ls
    show NotFound        = "-1"

listToResult :: [Int] -> Result
listToResult [] = NotFound
listToResult ls = ListResult ls
