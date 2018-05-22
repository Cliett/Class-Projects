import Data.List.Split hiding (startsWith)
import System.Exit
import DataTypes

main :: IO ()
main = do
    filePath <- promptLine "Please enter a path to the source file:" --"Text.hs"--(C:\Users\Rustywolf\Documents\CSCI 3300 SourceTree\project\Locked - Copy\Test.txt)
    file <- readFile filePath
    let input = lines file
    let cleanInput =scrubEmpty.cleanStrings $ input
    word <- promptLine "Please enter a word:"
    let theTape = fillTape word
    --print input
    --putStrLn "-------------------BANG-----------------------------"
    --print cleanInput
    let stringStates = cleanInput !! 0
    case (startsWith "{states: " stringStates) of
     False -> do
        putStrLn "Input Form Error: '{states: ', Try Again."
        return ()
     True -> do
        let listStringStates = splitOn ","  (takeWhile (\x -> x /= '}') (drop 9 stringStates))
        --print listStringStates
        let stringStart = cleanInput !! 1
        case (startsWith "{start: " stringStart) of
         False -> do
            putStrLn "Input Form Error: '{start: ', Try Again."
            return ()
         True -> do
            let listStringStart = (takeWhile (\x -> x /= '}') (drop 8 stringStart))
            --print listStringStart
            let stringAccept = cleanInput !! 2
            case (startsWith "{accept: " stringAccept) of
             False -> do
                putStrLn "Input Form Error: '{accept: ', Try Again."
                return ()
             True -> do
                let listStringAccept = (takeWhile (\x -> x /= '}') (drop 9 stringAccept))
                --print listStringAccept
                let stringReject = cleanInput !! 3
                case (startsWith "{reject: " stringReject) of
                 False -> do
                    putStrLn "Input Form Error: '{reject: ', Try Again."
                    return ()
                 True -> do
                    let listStringReject = (takeWhile (\x -> x /= '}') (drop 9 stringReject))
                    --print listStringReject
                    let stringAlpha = cleanInput !! 4
                    case (startsWith "{alpha: " stringAlpha) of
                     False -> do
                        putStrLn "Input Form Error: '{alpha: ', Try Again."
                        return ()
                     True -> do
                        let listStringAlpha = splitOn "," (takeWhile (\x -> x /= '}') (drop 8 stringAlpha))
                        --print listStringAlpha
                        let stringTapeAlpha =  cleanInput !! 5
                        case (startsWith "{tape-alpha: " stringTapeAlpha) of
                         False -> do
                            putStrLn "Input Form Error: '{tape-alpha: ', Try Again."
                            return ()
                         True -> do
                            let listStringTapeAlpha = "_": (splitOn "," (takeWhile (\x -> x /= '}') (drop 13 stringTapeAlpha)))
                            --print listStringTapeAlpha
        
                            --Check TM
        
                            case (allTrue listStringStates listStringAccept listStringReject listStringStart listStringTapeAlpha listStringAlpha) of
                             False -> do
                                putStrLn "Input Form Error: Either"
                                putStrLn "Start,Accept and Reject states are not present in list of states."
                                putStrLn "Or All items in alpha list are not present in alpha tape list."
                                return ()
                             True -> do
                                --Start TM
                                let instructionList =fullList (cleanInst(drop 6 cleanInput))
                                --print (checkAllInst instructionList)
                                --print theTape
                                
                                case (word) of
                                 "" -> do
                                    putStrLn "Input Form Error: \nMy Turing Assembler does not like being handed an empty word, my apologies."
                                    return ()
                                 _ -> do
                                    case (wordCheck listStringTapeAlpha word) of
                                     False -> do
                                        putStrLn "It seems you passed a word with an element not in alpha."
                                        putStrLn "Please check your word and try again."
                                        return ()
                                     True -> do
                                        case (checkAllInst instructionList) of
                                         False -> do
                                            putStrLn "It seems there was an error in the instruction commands list."
                                            putStrLn "Please check instruction names and try again."
                                            return ()
                                         True -> do
                                            case (checkAllInst' instructionList listStringStates listStringTapeAlpha) of
                                             False -> do
                                                putStrLn "It seems there was an error in the instruction commands list."
                                                putStrLn "Instruction variables not in list of states or tape-alpha found."
                                                putStrLn "Please check instruction variables and try again."
                                                return ()
                                             True -> do
                                                let pass = runInst instructionList
                                                let head = 0
                                                putStrLn (showTape head listStringStart theTape)
                                                (chead,ctape,cstate,caccept,creject,ctrans) <- run (head, theTape, listStringStart, listStringAccept, listStringReject, pass)
                                                if (cstate == caccept)
                                                then do
                                                    putStr "Accept: "
                                                    putStrLn (showTape chead cstate ctape)
                                                    main
                                                else do
                                                    putStr "Reject: "
                                                    putStrLn (showTape chead cstate ctape)
                                                    main        
             
                
              
    --Need more Error checking here
wordCheck :: [String] -> String -> Bool
wordCheck alphas [] = True
wordCheck alphas (y:ys) | wordCheck' alphas y == True = wordCheck alphas ys
                        | otherwise = False
                        
wordCheck' :: [String] -> Char -> Bool
wordCheck' [] char = False
wordCheck' (x:xs) char | x /= [char] = wordCheck' (xs) (char)
                       | otherwise = True
    
allTrue :: [State] -> State -> State -> State -> [String] -> [String] -> Bool
allTrue sts acc rej star tal al = do
    if (checkStates (sts,acc) && checkStates (sts,rej)&& checkStates (sts,star) && checkAlpha' (tal,al))
    then True
    else False
    
checkStates :: ([State],State) -> Bool
checkStates ([],st) = False
checkStates ((x:xs),st) | x == st = True
                        | otherwise = checkStates (xs,st)

checkAlpha :: ([String],String) -> Bool
checkAlpha ([],al) = False
checkAlpha ((x:xs),al) | x == al = True
                       | otherwise = checkAlpha (xs,al)

--tape-alpha alpha                      
checkAlpha' :: ([String],[String]) -> Bool
checkAlpha' (tp,[]) = True
checkAlpha' ((x:xs),(y:ys)) | checkAlpha ((x:xs),y) == True = checkAlpha' ((x:xs),ys)
                            | otherwise = False
                        
run :: (Head,Tape,State,Accept,Reject,Trans) -> IO (Head,Tape,State,Accept,Reject,Trans)
run (head, tape, state, accept, reject, trans) = do
    let current = find head tape --current is not Char
    case (lookup (state,current) trans) of  
        Nothing -> return (head,tape,reject,accept,reject,trans)
        Just (newState,newChar,newDir) -> do
            let newTape = replace tape head newChar
            if (newState == accept || newState == reject)
            then return ((newHead head newDir), newTape, newState, accept, reject, trans)
            else do
                putStrLn (showTape (newHead head newDir) newState newTape)            
                run ((newHead head newDir), newTape, newState, accept, reject, trans)
            
newHead :: Head -> Direction -> Int
newHead head dir | dir == R = (head + 1)
                 | head == 0 = 0
                 | otherwise = (head - 1)
  
runInst :: [[String]] -> Trans
runInst [] = []
runInst (x:xs) = (helper x): runInst xs
    
helper :: [String] -> ((State, Char),(State,Char,Direction))
helper (a:rest) = do
    case (a) of
        "rwRt" -> rwRt rest 
        "rwLt" -> rwLt rest
        "rRl" -> rRl rest
        "rLl" -> rLl rest
        "rRt" -> rRt rest
        "rLt" -> rLt rest
        
        


            
rwRt :: [String] -> ((State, Char),(State,Char,Direction))
rwRt [a,b,c,d] = ((a,b !! 0),(d,c !! 0,R))

rwLt :: [String] -> ((State, Char),(State,Char,Direction))
rwLt [a,b,c,d] = ((a,b !! 0),(d,c !! 0,L))

rRl :: [String] -> ((State, Char),(State,Char,Direction))
rRl [a,b] = ((a,b !! 0),(a,b !! 0,R))

rLl :: [String] -> ((State, Char),(State,Char,Direction))
rLl [a,b] = ((a,b !! 0),(a,b !! 0,L))

rRt :: [String] -> ((State, Char),(State,Char,Direction))
rRt [a,b,c] = ((a,b !! 0),(c,b !! 0,R))

rLt :: [String] -> ((State, Char),(State,Char,Direction)) 
rLt [a,b,c] = ((a,b !! 0),(c,b !! 0,L))
    
--Check is for making sure the instruction is valid.
--check' looks to see if instruction variables are within their respective lists.
checkAllInst :: [[String]] -> Bool
checkAllInst [] = True
checkAllInst (x:xs) | (checkInst x) = checkAllInst xs
                    | otherwise = False
                    
checkAllInst' :: [[String]] -> [State] -> [String] -> Bool
checkAllInst' [] states alphas = True
checkAllInst' (x:xs) states alphas | (checkInst' x states alphas) = checkAllInst' xs states alphas
                                   | otherwise = False
    
checkInst :: [String] -> Bool
checkInst [] = True
checkInst (x:rest) = do
    if (x == "rwRt" || x == "rwLt")
    then do
        let temp = skip 4 rest
        checkInst temp
    else do 
        if (x == "rRt" || x == "rLt")
        then do
            let temp2 = skip 3 rest
            checkInst temp2
        else do
            if ( x == "rRl" || x == "rLl")
            then do
                let temp3 = skip 2 rest
                checkInst temp3
            else False
            
checkInst' :: [String] -> [State] -> [String] -> Bool
checkInst' [] states alphas = True
checkInst' (x:rest) states alphas = do
    if (x == "rwRt" || x == "rwLt")
    then do
        checkRest rest 4 states alphas
    else do 
        if (x == "rRt" || x == "rLt")
        then do
            checkRest rest 3 states alphas
        else do
            if ( x == "rRl" || x == "rLl")
            then do
                checkRest rest 2 states alphas
            else False
    
skip :: Int -> [String] -> [String]
skip 0 str = str
skip n (x:xs) = skip (n-1) xs 

checkRest :: [String] -> Int -> [State] -> [String] -> Bool
checkRest rest com states alphas = do
    case com of
        2 -> do
            let (x:y:xs) = rest
            if ((checkStates (states,x)) == True && (checkAlpha (alphas,y)) == True)
            then True
            else False
            
        3 -> do
            let (x:y:z:xs) = rest
            if (checkStates (states,x) && checkAlpha (alphas,y) && checkStates (states,z))
            then True
            else False
        4 -> do
            let (x:y:z:a:xs) = rest
            if (checkStates (states,x) && checkAlpha (alphas,y) && checkAlpha (alphas,z) && checkStates (states,a))
            then True
            else False


    
fullList :: [String] -> [[String]]
fullList [] =[]
fullList (x:xs) = (splitOn " " x): fullList xs
    
cleanInst :: [String] -> [String]
cleanInst [] = []
cleanInst (x:xs) = (takeWhile (\x -> x /= ';') x): cleanInst xs
    
topString :: [String] -> String
topString [] =[]
topString (x:xs) = x
    
runInput :: [String] -> IO ()
runInput [] = putStrLn "Input exhausted."
runInput (x:xs) | startsWith "--" x == True = runInput xs
                | startsWith "rRl" x == True = do
                                               putStrLn "Run Write Loop"
                                               runInput xs
                | otherwise = putStrLn "BANG-----------------------------"
                
startsWith :: String -> String -> Bool
startsWith [] _ = True
startsWith _ [] = False
startsWith (x:xs) (y:ys) | x == y = startsWith xs ys 
                         | otherwise = False
                        
cleanString :: String -> String
cleanString [] = []
cleanString (x:[]) = x:[]
cleanString (x:y:[]) | x:y:[] == "--" = []
                     | otherwise = x:y:[]
cleanString (x:y:xs) | x:y:[] == "--" = []
                     | otherwise = x: cleanString (y:xs)
    
cleanStrings :: [String] -> [String]
cleanStrings [] = []
cleanStrings (x:xs) = (cleanString x): cleanStrings xs
    
scrubEmpty :: [String] -> [String]
scrubEmpty [] = []
scrubEmpty (x:xs) | isWS x = scrubEmpty xs
                  | otherwise = x: scrubEmpty xs

isWS :: String -> Bool
isWS [] = True
isWS (x:xs) | x == ' ' = isWS xs
            | x == '\t' = isWS xs
            | otherwise = False
                  
promptLine :: String -> IO String
promptLine prompt = do
    putStr prompt
    getLine

tape = ['_','_'..]
tape' = 'x' : tape

find :: Int -> String -> Char
find x y = y !! x

replace :: String -> Int -> Char -> String
replace (x:tape) 0 rpl = rpl: tape 
replace (x:tape) head rpl = x: replace tape (head-1) rpl  

showTape2 :: String -> String
showTape2 (x:xs) |x == '_' = []
                | otherwise = x: showTape2 xs
                           
showTape :: Int -> State -> String -> String
showTape head place stuff = (take head stuff) ++ "[" ++ place ++ "]" ++ takeWhile (\x -> x /= '_') (drop head stuff)

fillTape :: String -> String
fillTape [] = []
fillTape (x:xs) = (x:xs) ++ tape  