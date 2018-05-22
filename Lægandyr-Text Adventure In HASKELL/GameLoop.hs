module GameLoop where
import Support
import LaegandyrDice
import Map
import Text
import Data.Char

gameLoop :: String -> ([String],[Int]) -> ([String],[Int]) -> IO () --To pass character info into the game
gameLoop name attributes skills = do
    putStrLn "\n\n\nCongrats!"
    putStrLn ("You are in the game " ++ name ++ "!")
    putStrLn commandsDesc
    putStrLn ("If you get stuck, you could type 'commands' for a help.")
    promptLine "Press enter when you are ready to begin."
    --putStrLn (show (getSkill skills 1))
    --putStrLn (show (getAtt attributes 2))
    --temp <- actionRoll ((getAtt attributes 1) + (getSkill skills 1)) (getSkill skills 1)
    --putStrLn (show temp)
    --let startRoom = Room {roomName = "The StartRoom",roomDesc = "A very boring looking room.",roomExits = ["The Tower","The Bathroom"]}
    --putStrLn (describeRoom startRoom)
    roomLoop name attributes skills town
    return ()

roomLoop :: String -> ([String],[Int]) -> ([String],[Int]) -> Room -> IO ()
roomLoop name attributes skills room = do
    putStrLn (describeRoom room)
    command <- promptLine ">"
    let command2 = words (smallText command)
    --roomLoop name attributes skills room
    parse name attributes skills room command2
    
smallText :: String -> String
smallText [] = []
smallText (x:xs) = (toLower x): smallText xs  
    
parse :: String -> ([String],[Int]) -> ([String],[Int]) -> Room -> [String] -> IO ()    
parse name attributes skills room command = 
    case command of
        [] -> roomLoop name attributes skills room-- empty command
        ("commands":_) -> do
            putStrLn 
                "\n\n\nTry 'go to' or 'enter' for rooms, \n'fight the', 'sneak past the' or\n 'bargain with the' for enemies, 'speak with' for friends."      
            roomLoop name attributes skills room
        
        ("go":"to":"the":newRoom:_) -> do
            temp <- whichRoom name attributes skills newRoom room
            roomLoop name attributes skills temp
        ("go":"to":newRoom:_) -> do
            temp <- whichRoom name attributes skills newRoom room
            roomLoop name attributes skills temp
        ("go":newRoom:_) -> do
            temp <- whichRoom name attributes skills newRoom room
            roomLoop name attributes skills temp
        ("enter":"the":newRoom:_) -> do
            temp <- whichRoom name attributes skills newRoom room
            roomLoop name attributes skills temp
        ("enter":newRoom:_) -> do
            temp <- whichRoom name attributes skills newRoom room
            roomLoop name attributes skills temp
        ("fight":"the":enemy:_) -> do
            temp <- whichRoom name attributes skills ("fight" ++ enemy) room
            roomLoop name attributes skills temp
        ("fight":enemy:_) -> do
            temp <- whichRoom name attributes skills ("fight" ++ enemy) room
            roomLoop name attributes skills temp
        ("sneak":"past":"the":enemy:_) -> do
            temp <- whichRoom name attributes skills ("sneak" ++ enemy) room
            roomLoop name attributes skills temp
        ("sneak":"past":enemy:_) -> do
            temp <- whichRoom name attributes skills ("sneak" ++ enemy) room
            roomLoop name attributes skills temp
        ("sneak":enemy:_) -> do
            temp <- whichRoom name attributes skills ("sneak" ++ enemy) room
            roomLoop name attributes skills temp
        ("bargain":"with":"the":enemy:_) -> do
            temp <- whichRoom name attributes skills ("bargain" ++ enemy) room
            roomLoop name attributes skills temp
        ("bargain":"with":enemy:_) -> do
            temp <- whichRoom name attributes skills ("bargain" ++ enemy) room
            roomLoop name attributes skills temp
        ("bargain":enemy:_) -> do
            temp <- whichRoom name attributes skills ("bargain" ++ enemy) room
            roomLoop name attributes skills temp
        ("speak":"with":"the":enemy:_) -> do
            temp <- whichRoom name attributes skills ("speak" ++ enemy) room
            roomLoop name attributes skills temp
        ("speak":"with":enemy:_) -> do
            temp <- whichRoom name attributes skills ("speak" ++ enemy) room
            roomLoop name attributes skills temp
        ("speak":enemy:_) -> do
            temp <- whichRoom name attributes skills ("speak" ++ enemy) room
            roomLoop name attributes skills temp
        ("restart":_) -> do
            putStrLn "\nIf you insist."
            roomLoop name attributes skills town
        ("quit":_) -> do
            putStrLn "\nGoodBye!"
        (_) -> do
            roomLoop name attributes skills room
            
describeRoom :: Room -> String
--describeRoom room = ("\nYou are in " ++ roomName room ++ " it looks like:\n" ++ roomDesc room ++ describeExits (roomExits room))
describeRoom room = ("\n" ++ roomDesc room ++ describeExits (roomExits room))

describeExits :: [Exit] -> String
describeExits [] = []
describeExits (x:xs) = ("\nYou could " ++ x ++ describeExits xs) 


						  

--For Testing 
gameTest = 
    gameLoop "Bob" (["Strength","Dexterity","Constitution","Acumen","Cunning","Charisma"],[3,3,3,3,2,2]) (["Combat","Stealth","Converse"],[2,2,2])