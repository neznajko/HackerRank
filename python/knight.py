################################################################
# www.hackerrank.com/challenges/knightl-on-chessboard/problem
################################################################
################################################################
################################################################
################################################################
# 5 <= n <= 25
################################################################
################################################################
from collections import deque
################################################################
################################################################
FALSE, TRUE = 0, 1
################################################################
class Knight:
    def consmat( n ): #                                     vztd
        return [[ FALSE ] * n for _ in range( n )]
        
    def __init__( self, a, b ):
        self.dr = set([( -a, -b ),
                       ( -a, +b ),
                       ( -b, -a ),
                       ( -b, +a ),
                       ( +b, -a ),
                       ( +b, +a ),
                       ( +a, -b ),
                       ( +a, +b )])


    def push( self, levl, i, j ):
        self.deq.append(( levl, i, j ))
        self.vztd[ i ][ j ] = TRUE

    def get_min_moves( self, n ):
        self.deq = deque()
        self.vztd = Knight.consmat( n )
        self.push( 0, 0, 0 )
        while self.deq:
            levl, i, j = self.deq.popleft()
            if i == n - 1 and i == j: return levl
            for di, dj in self.dr:
                u = i + di
                v = j + dj
                if( u >= 0 and u < n and
                    v >= 0 and v < n and
                    self.vztd[ u ][ v ] == FALSE ):
                    self.push( levl + 1, u, v )
        return -1 
        
################################################################
################################################################
################################################################
################################################################
def knightlOnAChessboard( n ):
    mat = Knight.consmat( n - 1 )
    a = 1
    while a < n:
        b = 1
        while b < n:
            if a > b:
                mat[ a - 1 ][ b - 1 ] = mat[ b - 1 ][ a - 1 ]
            else:
                min_moves = Knight( a, b ).get_min_moves( n )
                mat[ a - 1 ][ b - 1 ] = min_moves
            b += 1
        a += 1
    return mat
################################################################
################################################################
################################################################
################################################################
if __name__=='__main__': #######################################
    n=int(input().strip()) #####################################
    result=knightlOnAChessboard(n) #############################
    print('\n'.join([' '.join(map(str, x)) for x in result])) ##
################################################################
################################################################
################################################################
################################################################
# Hackos:                                                   1524
# Max Score:                                               35.00
# Points:                                         1923.21 / 2200
# Rank:                                                    59477
################################################################
##### This is for those who feel unhappy or depressed or smashed
# from this life, try not repeating in your head non stop I will
#### manage, I will become this, I will do that, cos in case you
### have forgotten happiness is not a goal happiness is the path
