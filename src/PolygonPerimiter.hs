-- https://www.hackerrank.com/challenges/lambda-march-compute-the-perimeter-of-a-polygon
-- 6-20-2017
module PolygonPerimiter where

import           Control.Applicative (liftA2)
import           Control.Monad       (replicateM)

main :: IO ()
main = readLines

readLines :: IO ()
readLines = getLine
  >>= \n -> replicateM (readInt n) getLine
  >>= print . sum . getDistances . readCoord

readInt :: String -> Int
readInt = read

readCoord :: [String] -> [[Int]]
readCoord = loop . fmap (fmap read . words)

loop :: [a] -> [a]
loop []     = []
loop (x:xs) = x:xs++[x]

squareAbsDiff :: Int -> Int -> Float
squareAbsDiff a b = (**2) . abs . fromIntegral $ (-) a b

getDistance :: [Int] -> [Int] -> Float
getDistance [a,b] [c,d] = sqrt $ squareAbsDiff a c + squareAbsDiff b d
getDistance _ _         = 0

getDistances :: [[Int]] -> [Float]
getDistances = liftA2 (zipWith getDistance) id tail
