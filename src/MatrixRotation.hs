-- https://www.hackerrank.com/challenges/matrix-rotation
{-# LANGUAGE OverloadedStrings #-}

module MatrixRotation where

import           Control.Monad   (replicateM)
import           Data.List.Split (splitOn)
import           Data.Matrix

main :: IO ()
main = do
  (m:n:r:_) <- lineToNumbers <$> readLn
  matrix <- map lineToNumbers <$> replicateM m readLn
  mapM_ putStrLn . numbersToLine . rotateMatrixOnce  $ matrix

lineToNumbers = map readInt . splitOn " "

numbersToLine :: [[Int]] -> [String]
numbersToLine = map $ unwords . map show

readInt :: String -> Int
readInt = read

rotateMatrixOnce :: [[a]] -> [[a]]
rotateMatrixOnce = id



{-

a b c d e         b c d e j
f g h i j   ==>   a g h i o
k l m n o         f k l m n

a b c d e .. f g h i j .. k l m n o
/ / / /        | | |       \ \ \ \
b c d e j .. a g h i o .. f k l m n

-}
