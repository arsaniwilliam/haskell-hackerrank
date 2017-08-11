-- https://www.hackerrank.com/challenges/lambda-march-compute-the-area-of-a-polygon
-- 6-21-2017
module PolgonPerimiter where

import Control.Monad (replicateM)
import Control.Applicative (liftA2)

main :: IO ()
main = readLines

readLines :: IO ()
readLines = getLine 
  >>= \n -> replicateM (readInt n) getLine
  >>= print . (/2) . fromIntegral . abs . sum . getArea . readCoord

readInt :: String -> Int
readInt = read

readCoord :: [String] -> [[Int]]
readCoord = loop . fmap (fmap read . words)

loop :: [a] -> [a]
loop [] = []
loop (x:xs) = x:xs++[x]

squareAbsDiff :: Int -> Int -> Float
squareAbsDiff a b = (**2) . abs . fromIntegral $ (-) a b

step :: [Int] -> [Int] -> Int
step [a,b] [c,d] = a * d - b * c
step _ _ = 0

getArea :: [[Int]] -> [Int]
getArea = liftA2 (zipWith step) id tail
