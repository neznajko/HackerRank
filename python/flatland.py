################################################################
# www.hackerrank.com/challenges/flatland-space-stations/problem
################################################################
################################################################
################################################################
################################################################
# 0    1    2    3    4    5    6    7    8    9    a    b    c
#      ^         ^              %    _              ~
################################################################
def mindist( key, c ):
    n = len( c )
    l = 0
    u = n - 1
    while l <= u:
        m = ( l + u ) // 2
        if c[ m ] == key:
            l = m
            break
        if c[ m ] < key:
            l = m + 1
        else:
            u = m - 1
    if l == 0:
        return c[ 0 ] - key
    if l == n:
        return key - c[ -1 ]
    if c[ l ] == key:
        return 0
    return min( key - c[ l - 1 ], c[ l ] - key )
################################################################
################################################################
################################################################
def flatlandSpaceStations( n, c ):
    c.sort()
    m = 0
    for key in range( n ):
        m = max( m, mindist( key, c ))
    return m
################################################################
################################################################
################################################################
################################################################
if __name__=='__main__':                      ##################
    nm=input().split()                        ##################
    n=int(nm[0])                              ##################
    m=int(nm[1])                              ##################
    c=list(map(int,input().rstrip().split())) ##################
    result=flatlandSpaceStations(n,c)         ##################
    print(result)
################################################################
################################################################
################################################################
################################################################
# Hackos:                                                   1429
# Max Score:                                               25.00
# Points:                                         1743.21 / 2200
# Rank:                                                    69831
