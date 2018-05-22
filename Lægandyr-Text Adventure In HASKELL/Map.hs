module Map where
import LaegandyrDice

--"roomDesc \n "You could " ++ Exits  
dead = Room
    {roomName = "deceased."
    ,roomDesc = "You have met a terrible fate, haven't you?"
    ,roomExits = ["restart.","quit."]}
  
town = Room 
    {roomName = "a town."
    ,roomDesc = 
        "\n\nYou start out at the front door of the town's main bakery,\n" ++
        "'Madorins Sweets', having just bought one of their delicious\n" ++
        "small cakes and some bread for the quest you're about to\n" ++
        "embark on. Licking sugar from your lips you walk down the\n" ++
        "dirt road towards the outer wood gates. Thinking back on your\n" ++
        "time from the day before with a friend in the local inn, you go\n" ++
        "over the details of the adventure in your head once more.\n" ++
        "A special book in a wizard's tower located in the swamps a\n" ++
        "half day's walk from the town. Easy enough, you think,\n" ++ 
        "especially considering the coin and ale included in the\n" ++ 
        "payment for the task. You arrive at the town gates, wave at\n" ++ 
        "the guard on duty, and start on your way."
    ,roomExits = ["go to the bridge."]}
    
bridge = Room 
    {roomName = "a bridge."
    ,roomDesc = --"You are at a bridge."
        "\n\nAfter a few hours of quiet trek through the woods,\n" ++
        "listening to the birds sing and the wind rustle through\n" ++
        "the trees, you happen upon a deep ravine with a thick\n" ++
        "fallen tree to cross. Sitting on a large rock near the\n" ++
        "bridge, is a troll who growls in response to your presence.\n" ++
        "He pulls himself up and stomps towards you." 
    ,roomExits = ["fight the troll.","bargain with the troll."]}
    
killTroll = Room 
    {roomName = "fight troll."
    ,roomDesc = --"You fight the troll."
        "\n\nYou pull your weapon and face the troll in battle. After\n" ++
        "a brief struggle you slay the beast and continue on your way."
    ,roomExits = ["go to the swamp."]}
    
bargainTroll = Room 
    {roomName = "bargain troll."
    ,roomDesc = --"You bargain the troll."
        "\n\nApproaching the troll, you offer to pay for passage in coin.\n" ++
        "The troll looks at the pouch for a moment, weighing it in its\n" ++
        "mind before agreeing to your tribute. You are now free to pass."
    ,roomExits = ["go to the swamp."]}
    
bargainFail = Room 
    {roomName = "fail bargain troll."
    ,roomDesc = --"You fail to bargain the troll."
        "\n\nApproaching the troll, you offer to pay for passage in coin.\n" ++
        "The troll roars in fury at the miniscule amount of coin you have\n" ++
        "offered him. And attacks in a fury. Luckily you had your other\n" ++
        "hand on your weapon and was able to slay the creature before it\n" ++
        "could harm you. You are now able to continue forward."
    ,roomExits = ["go to the swamp."]}
    
swamp = Room
    {roomName = "a swamp."
    ,roomDesc = --"You are in a swamp, but you see a tower."
        "\n\nAfter crossing the bridge and travelling a few more hours you\n" ++
        "reach the edge of a muggy swamp. Not far from the path stands an\n" ++
        "old stone tower, beginning to sink into the mud from age and weight."
    ,roomExits = ["enter the tower."]} 
    
tower = Room
    {roomName = "tower first floor."
    ,roomDesc = --"You are in a tower, and you see a giant sneak eating a person."
        "\n\nUpon entering the tower you happen upon a giant snake in the midst of\n" ++
        "swallowing a person. If you do not wish to fight the snake, it might be\n" ++
        "possible to sneak past it by using rubble as cover and staying quiet." 
    ,roomExits = ["fight the snake.","sneak past the snake."]} 
    
killSnake = Room
    {roomName = "fight snake."
    ,roomDesc = --"You are fight the snake. You go upstairs, and find a wizard."
        "\n\nYou decide to fight the behemoth, drawing your weapon and dashing towards\n" ++
        "its back side. It hisses and pulls back to strike, but you defeat it in\n" ++
        "one fell blow. After taking a moment to catch your breath, you venture\n" ++
        "upstairs and find an old wizard behind a makeshift barricade."
    ,roomExits = ["speak with the wizard"]} 
    
sneakSnake = Room
    {roomName = "sneak snake."
    ,roomDesc = --"You sneak past the snake. You go upstairs, and find a wizard."
        "\n\nYou decide to sneak past the snake, edging your way along the wall and\n" ++
        "using the wrecked furniture as cover. You make your way up the stairs\n" ++
        "without it noticing. Once upstairs, you find an old wizard behind a\n" ++
        "makeshift barricade." 
    ,roomExits = ["speak with the wizard"]}    
    
sneakFail = Room
    {roomName = "fail sneak snake."
    ,roomDesc = --"You fail to sneak past the snake. You fight it, go upstairs, and find a wizard."
        "\n\nYou attempted to sneak past along the wall but the snake noticed your\n" ++
        "presence and it quickly swallows the remains of its prey and hurries\n" ++
        "forward to attack. You take advantage of the extra moment from the monster\n" ++
        "finishing its meal to draw your weapon and defend yourself. After a heated\n" ++
        "dodge and strike, you land a finishing blow through the eye, ending the\n" ++
        "creature and continuing on your way to the second level. There you find an\n" ++
        "old wizard behind a makeshift barricade."
    ,roomExits = ["speak with the wizard."]}
    
killSnakeSuccess = Room
    {roomName = "snake is dead"
    ,roomDesc = --"You killed the snake before the wizard could ask."
        "\n\nThe old wizard informs you that there is a monster downstairs out for his head\n" ++
        "and he would greatly appreciate if you would be willing to kill it for him, he\n" ++
        "would reward you, of course. You inform him that you have already felled the\n" ++
        "creature, and that you are here in search of a certain book. The wizard turns\n" ++
        "to take a book from one of the many shelves in the room and hands it through a\n" ++
        "gap in the barricade to you. He asks if there is anything else he can give you.\n" ++
        "You thank him for the book and turn down his request, saying that you should be\n" ++
        "on your way now. You hurry to leave the tower in anticipation to be back home\n" ++
        "with some cold ale and a nice fire."
    ,roomExits = ["restart.","quit."]} 

needToKill = Room
    {roomName = "snake is must be defeated."
    ,roomDesc = --"The wizard agrees to give you the book if you defeat the snake."
        "\n\nAfter you sneak past the snake and up the stairs you meet a wizard behind a\n" ++
        "makeshift barricade. He informs you that there is a monster downstairs out for\n" ++
        "his head and he would greatly appreciate if you would be willing to kill it for\n" ++
        "him, he would reward you, of course. You inform him that you are here in search\n" ++
        "of a certain book. He says he would gladly give you the book if you would kill\n" ++
        "the beast." 
    ,roomExits = ["fight the snake","sneak downstairs"]}     

sneakSuccessKill = Room
    {roomName = "snake is dead"
    ,roomDesc = --"You run down the stairs and slay the snake."
        "\n\nYou run back down the stairs, weapon drawn, and attack the snake from behind.\n" ++
        "Having finished its meal it turns on you and strikes. Rolling to the side you dodge\n" ++
        "the attack, bringing your weapon down on its head and severing it from the body.\n" ++
        "Afterwards you return to the wizard for your reward, eager to return home.\n" ++
        "The wizard turns to take a book from one of the many shelves in the room and hands\n" ++
        "it through a gap in the barricade to you. He asks if there is anything else he can\n" ++
        "give you. You thank him for the book and turn down his request, saying that you\n" ++
        "should be on your way now. You hurry to leave the tower in anticipation to be back\n" ++
        "home with some cold ale and a nice fire."
    ,roomExits = ["restart.","quit."]}
    
assassinate = Room
    {roomName = "snake is dead"
    ,roomDesc = --"You sneak down the stairs and assassinate the snake."
        "\n\nYou sneak back down the stairs to face the snake. The creature has just finished\n" ++
        "its meal and was laid down to rest awhile when you plunged your weapon into the\n" ++
        "back of its neck, killing it. Afterwards you return to the wizard for your\n" ++
        "reward, eager to return home. The wizard turns to take a book from one of the\n" ++
        "many shelves in the room and hands it through a gap in the barricade to you.\n" ++
        "He asks if there is anything else he can give you. You thank him for the book\n" ++
        "and turn down his request, saying that you should be on your way now. You hurry\n" ++
        "to leave the tower in anticipation to be back home with some cold ale and a\n" ++
        "nice fire."
    ,roomExits = ["restart.","quit."]} 
    
    
    
    
whichRoom :: String -> ([String],[Int]) -> ([String],[Int]) -> String -> Room -> IO Room
whichRoom name attributes skills find current=
    case find of
        "bridge" -> do 
            if current == town
            then return bridge
            else do
                putStrLn "You cannot go there at this time."
                return current
        "fighttroll" -> do 
            if current == bridge
            then do
            temp <- showRoll attributes skills str combat
            if (temp >= 15)
            then return killTroll
            else do
                putStrLn "\nIn the heat of the battle, your martial capabilities failed you."
                return dead
                
            else do
                putStrLn "You cannot fight that at this time."
                return current
        "fightsnake" -> do 
            if current == tower
            then do
            temp <- showRoll attributes skills str combat
            if (temp >= 15)
            then return killSnake
            else do
                putStrLn "\nIn the heat of the battle, your martial capabilities failed you."
                return dead
                
            else do
                if (current == needToKill)
                then do
                temp2 <- showRoll attributes skills str combat
                if (temp2 >= 20)
                then return sneakSuccessKill
                else do
                    putStrLn "\nIn the heat of the battle, your martial capabilities failed you."
                    return dead
                else do
                    putStrLn "You cannot fight that at this time."
                    return current
        "bargaintroll" -> do
            --temp <- actionRoll (getAtt attributes 2) (getSkill skills 2)
            --temp <- fmap sum (staticNum $ apply (getAtt attributes dex) results)
            if current == bridge
            then do
            temp <- showRoll attributes skills cha converse
            if (temp >= 13)
            then return bargainTroll
            else do
                putStrLn "\nYou fail to bargain with the troll and it attacks in a rage at your audacity!"
                temp2 <- showRoll attributes skills dex combat
                if (temp2 >= 15)
                then return bargainFail
                else do 
                    putStrLn "You fail your combat check and the troll strikes you down before you can draw your weapon."
                    return dead
                
            else do
                putStrLn "You cannot bargain at this time."
                return current
        "sneaksnake" -> do
            --temp <- actionRoll (getAtt attributes 2) (getSkill skills 2)
            --temp <- fmap sum (staticNum $ apply (getAtt attributes dex) results)
            if current == tower
            then do
            temp <- showRoll attributes skills dex stealth
            if (temp >= 15)
            then return sneakSnake
            else do
                putStrLn "\nYou fail to sneak past the snake and it attacks in a rage at your audacity!"
                temp2 <- showRoll attributes skills dex combat
                if (temp2 >= 15)
                then return sneakFail
                else do 
                    putStrLn "You fail your combat check and the troll strikes you down before you can draw your weapon."
                    return dead
                
            else do
                putStrLn "You cannot bargain at this time."
                return current 
        "sneakdownstairs" -> do
            if (current == needToKill)
            then do
            temp <- showRoll attributes skills dex combat
            if (temp >= 10)
            then return assassinate
            else do
                putStrLn "You failed to sneak up on the snake, and it ate you."
                return dead
            else do
                putStrLn "You cannot do that at this time."
                return current
        "swamp" -> do
            if (current == killTroll || current == bargainTroll || current == bargainFail)
            then return swamp
            else do 
                putStrLn "You cannot go there at this time."
                return current
        "tower" -> do
            if (current == swamp)
            then return tower
            else do 
                putStrLn "You cannot go there at this time."
                return current
        "speakwizard" -> do
            if (current == killSnake || current == sneakFail)
            then return killSnakeSuccess
            else do
                if (current == sneakSnake)
                then return needToKill
                else do
                putStrLn "You cannot speak with this person at this time."
                return current
        _ -> do
            putStrLn "\n\n\nI'm sorry, perhaps you did not speak clearly enough for me to understand.\nPlease try again."
            return current
            
type Exit = String

showRoll :: ([String],[Int]) -> ([String],[Int]) -> Int -> Int -> IO Int
showRoll attributes skills att sk = do
    let toRoll = ((getAtt attributes att)+(getSkill skills sk))
    results <- roll toRoll
    putStrLn ("\n\n\nYour "++ getAtt' attributes att ++ " and " ++ getSkill' skills sk ++ " skills combined let you roll "  ++show toRoll ++ " dice: "  ++ show results )
    putStrLn ("Your "++ getAtt' attributes att ++ " attribute lets you keep the " ++show (getAtt attributes sk) ++ " highest dice.")
    putStrLn ("Your total result is: " ++ show (apply (getAtt attributes sk) results) ++ 
                " = "++show (sum (apply (getAtt attributes sk) results)))
    fmap sum (staticNum $ apply (getAtt attributes att) results)

str = 0
dex = 1
con = 2
acu = 3
cun = 4
cha = 5


combat = 0
stealth = 1
converse = 2
   
data Room = Room
    {roomName :: String
    ,roomDesc :: String
    ,roomExits :: [Exit]
    --roomEnemy :: String
    } deriving (Eq) --Only works if the held data can be checked for equality

getSkill :: ([String],[Int]) -> Int -> Int
getSkill (x:xs, y:ys) num | num <= 0 = y
                          | otherwise = getSkill (xs, ys) (num-1)

getAtt :: ([String],[Int]) -> Int -> Int
getAtt (x:xs, y:ys) num | num <= 0 = y
                        | otherwise = getAtt (xs, ys) (num-1)
                        
getAtt' :: ([String],[Int]) -> Int -> String
getAtt' (x:xs, y:ys) num | num <= 0 = x
                        | otherwise = getAtt' (xs, ys) (num-1)

getSkill' :: ([String],[Int]) -> Int -> String
getSkill' (x:xs, y:ys) num | num <= 0 = x
                          | otherwise = getSkill' (xs, ys) (num-1)                        
                        