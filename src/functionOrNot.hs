module FunctionOrNot where

main :: IO ()
main =
  putStrLn . head . lines =<< getContents
