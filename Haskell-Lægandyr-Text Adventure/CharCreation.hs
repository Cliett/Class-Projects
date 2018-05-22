module CharCreation where
import Support
import Text
import GameLoop

gatherSkills :: Int -> IO ([String],[Int])
gatherSkills total = do
    putStrLn ("You have " ++ show total ++ " points to spend on skills.")
    temp1 <- promptLine "How many points do you want to put into Combat?>"
    let com = stringToInt temp1
    putStrLn ("You have " ++ show (total - com) ++ " points remaining.")
    temp2 <- promptLine "How many points do you want to put into Stealth?>"
    let stlth = stringToInt temp2
    putStrLn ("You have " ++ show (total - com - stlth) ++ " points remaining.")
    temp3 <- promptLine "How many points do you want to put into Converse?>"
    let con = stringToInt temp3
    putStrLn ("You have " ++ show (total - com - stlth - con) ++ " points remaining.")
    --temp4 <- promptLine "How many points do you want to put into Acumen?>"
    --let acu = stringToInt temp4
    --putStrLn ("You have " ++ show (total - str - dex - con - acu) ++ " points remaining.")
    --temp5 <- promptLine "How many points do you want to put into Cunning?>"
    --let cun = stringToInt temp5
    --putStrLn ("You have " ++ show (total - str - dex - con - acu - cun) ++ " points remaining.")
    --temp6 <- promptLine "How many points do you want to put into Charisma?>" 
    --let cha = stringToInt temp6
    if (total - com - stlth - con /= 0)
    then do
        putStrLn "You did not allocate your points properly."
        promptLine "Try again."
        createChar
    else putStrLn "Good Job! You used up all your points!"
    return (["Combat", "Stealth", "Converse"],[com,stlth,con])	

gatherAtts :: Int -> IO ([String],[Int])
gatherAtts total = do
    putStrLn ("You have " ++ show total ++ " points to spend on the following attributes:")
    putStrLn "Strength, Dexterity, Constitution, Acumen, Cunning, and Charisma."
    temp1 <- promptLine "How many points do you want to put into Strength?>"
    let str = stringToInt temp1
    putStrLn ("You have " ++ show (total - str) ++ " points remaining.")
    temp2 <- promptLine "How many points do you want to put into Dexterity?>"
    let dex = stringToInt temp2
    putStrLn ("You have " ++ show (total - str - dex) ++ " points remaining.")
    temp3 <- promptLine "How many points do you want to put into Constitution?>"
    let con = stringToInt temp3
    putStrLn ("You have " ++ show (total - str - dex - con) ++ " points remaining.")
    temp4 <- promptLine "How many points do you want to put into Acumen?>"
    let acu = stringToInt temp4
    putStrLn ("You have " ++ show (total - str - dex - con - acu) ++ " points remaining.")
    temp5 <- promptLine "How many points do you want to put into Cunning?>"
    let cun = stringToInt temp5
    putStrLn ("You have " ++ show (total - str - dex - con - acu - cun) ++ " points remaining.")
    temp6 <- promptLine "How many points do you want to put into Charisma?>" 
    let cha = stringToInt temp6
    if (total - str - dex - con - acu - cun - cha /= 0)
    then do
        putStrLn "You did not allocate your points properly."
        promptLine "Try again."
        createChar
    else putStrLn "Good Job! You used up all your points!"
    return (["Strength","Dexterity","Constitution","Acumen","Cunning","Charisma"],[str+1,dex+1,con+1,acu+1,cun+1,cha+1])

createChar :: IO ()
createChar = do
    putStrLn intro
    charName <- promptTwoLines "What is your character's first name?: " "What is your character's last name?: "
    putStrLn $ ("\n\n\nWelcome to the game " ++ charName ++ "!")
    putStrLn attributeDesc
    promptLine "That was probably a lot to read, but it will make sense.\nHit enter when you are ready to continue."
    putStrLn attributeFuncDesc
    putStrLn "Feeling confident about how attributes are used in the world of Laegandyr?"
    promptLine "Hit enter when you are ready to assign a score to your characters attributes."
    putStrLn "\n\n\nYour character starts with a 1 in every attribute, \nbut you can spend more points to improve the score."
    putStrLn "Make sure to use every point, but no more than the amount given."
    attributes <- gatherAtts 10
    putStrLn ("Your character name is: " ++ charName)
    putStrLn ("Your character has the following attributes: ")
    showStats attributes
    promptLine "Press enter when you are ready to continue."    
    putStrLn skillDesc
    skills <- gatherSkills 6
    putStrLn ("Your character name is: " ++ charName)
    putStrLn ("Your character has the following attributes: ")
    showStats attributes
    putStrLn ("Your character has the following skills: ")
    showStats skills
    promptLine "Press enter to begin the game."
    gameLoop charName attributes skills
    return ()






