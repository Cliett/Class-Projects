module Text where

commandsDesc = 
    "Commands for the game should look like:\n" ++
    "'Go to (location)' or 'Fight with (creature name)'\n" ++
    "'Speak/Bargain with (Friend name)'"

intro = "\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n\n" ++
    "Welcome to the world of Laegandyr!\n" ++
    "This is a short text adventure which will guide you through\n" ++
    "making a character and the basics of the dice system for the\n" ++
    "Pen & Paper game: Laegandyr. So, let's get started...\n"
	
attributeDesc = "All characters are portrayed by six main attributes: \n" ++
    "Strength: Determines the raw might and power of a character.\n" ++
    "    How much can you lift? How hard can you throw a punch? How far can \n    you throw?\n" ++
    "Dexterity: Determines your reflexes, speed, precision, and range of motion.\n" ++
    "    How steady is your hand while picking a lock? How are you at juggling?\n" ++
    "    Can you balance on a beam?\n" ++
    "Constitution: Determines how sturdy you are.\n" ++ 
    "    How often do you get sick? How well can you take a punch? How long can\n" ++ 
    "    you keep up strenuous actions before becoming fatigued?\n" ++
    "Acumen: Determines a characters capacity to understand.\n" ++
    "    Do you know multiple languages? How good are you at math? Why is your\n" ++
    "    girlfriend upset with you?\n" ++
    "Cunning: Determines a characters ingenuity, craftiness, and guile.\n" ++
    "    How well do you improvise? Can you perform? Have you devised a plan\n" ++
    "    to get your girlfriend to forgive you?\n" ++
    "Charisma: Determines the qualities that allow a character to influence others.\n" ++
    "    How well can you lead a group? Can others clearly understand a task\n" ++ 
    "    you ask them to perform? Can you convince another to trust you with a\n    secret?\n"
	
attributeFuncDesc = "\n\n\nEach point in an attribute modifies how well your character can do certain\n" ++
    "things. Specifically, the core game of Laegandyr depends on the combination of\n" ++
    "the relevant attributes combined with the relevant skill for the chosen task.\n" ++
    "In the game of Laegandyr, a number of ten sided dice are rolled equal to your\n" ++
    "characters combined attribute and skill. If the die result is a ten, you roll\n" ++
    "again and add the result to the original number, counting as one combined\n" ++
    "number. So a face value of 10 can be rolled again. A result of 7 would mean\n" ++
    "that the die would be treated as rolling a 17. In fact, you keep doing this\n" ++
    "as long as you keep rolling 10s, and the face value of the die increases with\n" ++
    "each roll. Your character then gets to keep a number of dice equal to the tasks\n" ++
    "relevant attribute score. Additionally, certain skills modify your characters\n" ++
    "stats. For instance, a high constitution will result in more health for your\n" ++
    "character.\n"

skillDesc = "\n\n\nYour character has skills which denote how good they are at certain\n" ++
    "actions beyond what their innate attributes allow.\n" ++
    "For now, let us assume you have access to three skills:\n" ++
    "Combat, Converse, and Stealth.\n" ++
    "Unlike attributes, skills begin with a rank of 0.\n"
	