module Support where
promptLine :: String -> IO String
promptLine prompt = do
    putStr prompt
    getLine
	
promptTwoLines :: String -> String -> IO String
promptTwoLines prompt1 prompt2 = do
    line1 <- promptLine prompt1                         -- line1 :: String
    line2 <- promptLine prompt2                         -- line2 :: String
    return (line1 ++ " " ++ line2)

stringToInt :: String -> Int
stringToInt x = read x

showStats :: ([String],[Int]) -> IO ()
showStats (_,[]) = return ()
showStats ([],_) = return ()
showStats (x:xs, y:ys) = do
    putStrLn (x ++ " = " ++ show y)
    showStats (xs, ys)
    return ()