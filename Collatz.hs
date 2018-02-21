
numToFG :: Integer -> [Char]
numToFG 1 = []
numToFG x | mod x 2 == 0 = 'F' : numToFG (div x 2)
numToFG x = 'G' : numToFG (3 * x + 1)

fGForNum :: Integer -> [Char]
fGForNum x = reverse $ numToFG x

fGtoLs :: [Char] -> [Int]
fGtoLs ls = fGtoLs' ls 0
 where fGtoLs' [] cnt = [0]
       fGtoLs' "G" cnt = [cnt, -1]
       fGtoLs' "F" cnt = [cnt + 1, 0]
       fGtoLs' ('G' : ls) cnt = cnt : fGtoLs' ls 0
       fGtoLs' ('F' : ls) cnt = fGtoLs' ls (cnt + 1)

numToLs :: Integer -> [Int]
numToLs n = fGtoLs $ fGForNum n