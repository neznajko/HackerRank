################################################################
# www.hackerrank.com/challenges/richie-rich/problem
################################################################
#######  =######################################################
#######  ###########                                           #
#@@@#      #@@@@####       ##############################       
#@@@        @@@@####       ####       ###################       
####        ##################                         #########
####        #################       ############################
#@@          @@@############                         ###########
#@@@        @@@@###########       ############       ###########
####        ##################################       ###########
#####      #########                                              
#@@@@  @@  @@@@@##############################       ###########
#@@@@  @@  @@@@@#############################       ###########@
##### #### #################################       #############
##### #### ###############################       ###############
#@@@@ @@@@ @@@@@#######################       #################@
#@@@@ @@@@ @@@@@###############################################@
################################################################
def highestValuePalindrome( s, n, k ):
    return maxpalin( list( s ), k )
################################################################
################################################################
## 写真　しゃしん　Foto
## 手紙　てがみ　　Brief
## 机　　つくえ　　Schreibtisch
## 猫　　ねこ　　　Katze
################################################################
################################################################
def maxpalin( s, k ):
    n = len( s )
    m = ( n + 1 )// 2
    are_same = [ False ] * m
    i = 0
    j = n - 1
    while i < j:
        if s[ i ] == s[ j ]:
            are_same[ i ] = True
        else:
            s[ i ] = s[ j ] = max( s[ i ], s[ j ])
            k -= 1
            if k < 0: return "-1"
        i += 1
        j -= 1
    i = 0
    j = n - 1
    while i <= j and k > 0:
        if s[ i ] != '9':
            if are_same[ i ]:
                if k > 1:
                    s[ i ] = s[ j ] = '9'
                    k -= 2
            else:
                s[ i ] = s[ j ] = '9'
                k -= 1
        i += 1
        j -= 1
    return "".join( s )
################################################################
################################################################
################################################################
################################################################
if __name__ == '__main__':
    first_multiple_input = input().rstrip().split()
    n = int( first_multiple_input[ 0 ])
    k = int( first_multiple_input[ 1 ])
    s = input()
    result = highestValuePalindrome( s, n, k )
    print( result )
################################################################
################################################################
################################################################
################################################################
# Hackos:                                                   1195
# Max Score:                                               30.00
# Points:                                         1540.26 / 2200
# Rank:                                                    85708
