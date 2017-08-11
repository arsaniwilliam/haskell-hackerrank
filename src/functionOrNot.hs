module FunctionOrNot where
  
main :: IO ()
main = do 
  contents <- getContents
  putStrLn . head . lines . contents