################################################################
########### www.hackerrank.com/challenges/gridland-metro/problem
################################################################
### The city of Gridland is represented as an n x m matrix where
# the rows are numbered from 1 to n and the columns are numbered
# from 1 to m ..
################################################################
# 1 <= n, m <= 10^9
# 0 <= k <= 1000
################################################################
LEFT, RYTE = 0, 1
################################################################
def merge_intvls( intvls ):
    n = len( intvls )
    curr_intvl = list( intvls[ n - 1 ])
    merged = []
    j = n - 2
    while j >= 0:
        intvl = intvls[ j ]
        if intvl[ RYTE ] < curr_intvl[ LEFT ]:
            merged.append( tuple( curr_intvl ))
            curr_intvl = list( intvl )
        else:
            curr_intvl[ LEFT ] = min( curr_intvl[ LEFT ],
                                      intvl[ LEFT ])
            curr_intvl[ RYTE ] = max( curr_intvl[ RYTE ],
                                      intvl[ RYTE ])
        j -= 1
    merged.append( tuple( curr_intvl ))
    return merged
################################################################
################################################################
from collections import defaultdict
################################################################
################################################################
def gridlandMetro( n, m, k, track ):
    total_cells = n * m
    intvls = defaultdict( list )
    for rank, left, ryte in track:
        intvls[ rank ].append(( left, ryte ))
    for rank in intvls:
        intvls[ rank ].sort()
        merged_intvls = merge_intvls( intvls[ rank ])
        for intvl in merged_intvls:
            total_cells -= intvl[ RYTE ] - intvl[ LEFT ] + 1
    return total_cells
################################################################
################################################################
################################################################
################################################################
if __name__ == '__main__': #####################################
    first_multiple_input = input().rstrip().split() ############
    n = int(first_multiple_input[0]) ###########################
    m = int(first_multiple_input[1]) ###########################
    k = int(first_multiple_input[2]) ###########################
    track = [] #################################################
    for _ in range(k): #########################################
        track.append(list(map(int,input().rstrip().split()))) ##
    result = gridlandMetro(n, m, k, track) #####################
    print(str(result)) #########################################
################################################################
################################################################
################################################################
################################################################
# Hackos:                                                   1524
# Max Score:                                               25.00
# Points:                                         1888.21 / 2200
# Rank:                                                    61232
