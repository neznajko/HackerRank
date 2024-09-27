################################################################
# hackerrank.com/challenges/almost-sorted/
################################################################
################################################################
################################################################
################################################################
# 2 ≤ n ≤ 10⁵
# 0 ≤ a ≤ 10⁶
# all a are distinct
################################################################
################################################################
from math import inf
################################################################
################################################################
SORTED  = 0
SWAP    = 1
REVERSE = 2
NO      = 3
################################################################
################################################################
NOPE = NO, None, None
################################################################
################################################################
def check( a ):
    j = 1
    # find left
    a.append( -1 )
    while a[ j - 1 ] < a[ j ]: j += 1
    if a[ j ] == -1: return SORTED, None, None
    left = j - 1
    # probing for reverse
    a[ -1 ] = inf
    while a[ j ] > a[ j + 1 ]: j += 1
    ryte = j
    if ryte - left > 1: #                      reverse candidate
        # a) check if reversing will keep the order
        if left > 0:
            if a[ ryte ] < a[ left - 1 ]:
                return NOPE
        if a[ left ] > a[ ryte + 1 ]:
            return NOPE
        # b) check if remaining array is sorted
        for i in range( ryte + 1, len( a ) - 2 ):
            if a[ i ] > a[ i + 1 ]: return NOPE
        return REVERSE, left, ryte
    # probing for swap
    # a) order check
    if left > 0:
        if a[ j ] < a[ left - 1 ]: return NOPE
    # find ryte
    a[ -1 ] = -1
    j += 1
    while a[ j - 1 ] < a[ j ]: j += 1
    if a[ j ] == -1:
        ryte = left + 1
    else:
        ryte = j
    # b) order check
    if left > 0:
        if a[ ryte ] < a[ left - 1 ]: return NOPE
    if a[ ryte ] > a[ left + 1 ]: return NOPE
    if a[ left ] < a[ ryte - 1 ]: return NOPE
    if a[ ryte + 1 ] != -1:
        if a[ left ] > a[ ryte + 1 ]: return NOPE
    # c) check if remaining array is sorted
    for i in range( ryte + 1, len( a ) - 2 ):
        if a[ i ] > a[ i + 1 ]: return NOPE
    return SWAP, left, ryte
################################################################
################################################################
################################################################
################################################################
def almostSorted( a ):
    result, left, ryte = check( a )
    if result == NO:
        print( "no" )
    else:
        print( "yes" )
        if result != SORTED:
            print(( "swap", "reverse" )[ result == REVERSE ],
                  left + 1, ryte + 1 )            
################################################################
if __name__=='__main__':
    n=int(input().strip())
    arr=list(map(int,input().rstrip().split()))
    almostSorted(arr)
################################################################
################################################################
################################################################
################################################################
# Hackos:                                                   1833
# Score:                                                      50
# Points:                                                   2723
# Rank:                                                    24505
# Challenges:                                          101 / 563
# 1.3.27*: A spherical tank located on the ground has radius R.
# With what minimal velocity a stone can be thrown from the
# ground so it just touches tank's top?
#
# Whenever the acceleration of a body has non nil projection
# perpendicular to its velocity that will bend the trajectory:
# a = v²|R, in case of a body thrown towards the horizon, the
# trajectory will have smallest radius at the top, cos the
# acceleration perpendicular to the velocity is maximum equal to
# g and the velocity is minimal: R = v²|g, this equation will
# give us the minimal velocity below which the trajectory will
# have smaller radius than the tank's radius. So on the tank's
# top we have v² = Rg. If ground velocity is u, we have:
# u²|2 = v²|2 + 2Rg, u² = v² + 4Rg = 5Rg, zo u = √(5Rg)        «   
################################################################
