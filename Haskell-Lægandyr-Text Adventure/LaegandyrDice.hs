module LaegandyrDice where
import System.Random

rollDie :: Int -> IO [Int]
rollDie r = do
	gtr <- newStdGen
	return $ take r $ randomRs (1,10) gtr

flareDie :: [Int] -> [Int]
flareDie [] = []
flareDie (x:[]) = x:[]
flareDie (x:y:xs) | x `mod` 10 == 0 = flareDie ((x+y):xs)
				  | otherwise = x: flareDie (y:xs)

helper :: Int -> IO [Int]				  
helper n =fmap flareDie.rollDie $ (10+2*n)

staticNum :: [Int] -> IO [Int]
staticNum n = return n

simpleNum :: Int -> IO Int
simpleNum n = return n

roll :: Int -> IO [Int]
roll n =do
   x <- helper n
   staticNum $ take n x

isOrdered :: (Ord a) =>[a] -> Bool
isOrdered [] = True
isOrdered (x:[]) = True
isOrdered (x:y:xs) | x <= y = isOrdered (y:xs)
				   | otherwise = False

sort :: [Int] -> [Int]
sort [] = []
sort (x:[])= x:[]
sort (x:y:xs) | x <= y = x: sort (y:xs)
			  | otherwise = sort (y:x:xs)
	
cSort :: [Int] -> [Int]
cSort n | isOrdered n == False = cSort.sort $ n
		| otherwise = n
				
apply :: Int -> [Int] -> [Int]
apply n lis = take n (reverse.cSort $ lis)

rollAndApply :: Int -> Int -> IO [Int]
rollAndApply x y = do
	z <- roll x
	staticNum $ apply y z

actionRoll :: Int -> Int -> IO Int	
actionRoll x y = fmap sum (rollAndApply x y)