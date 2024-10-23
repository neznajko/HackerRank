################################################################
################################################################
################################################################
################################################################
# hackerrank.com/challenges/two-characters/
################################################################
################################################################
################################################################
################################################################
def checkpair( x, y )
    # cos we want x and y offsets to be alternating we must have
    # thus:
    # x:   1         6       10
    # y:           5   7              13,
    # that is for all j: x[ j] < y[j ] < x[ j + 1], so the lengt
    # h of x and y offsets must differ at most with one, like in
    # the case of babab!
    # Further cos of the way h mapping was constructed and the w
    # ay x and y are passed here we always have:
    # x[ 0] < y[ 0],
    # so if x offsets are with one more then y it's ok like with
    # the above example, but if y are more then we have a proble
    # m: babaa
    dif = x.length - y.length 
    return 0 if dif < 0 or dif > 1
    for j in ( 0 .. y.length - 1 )
        # x[ j ] < y[ j ]
        return 0 if y[ j ] < x[ j ]
        # y[ j ] < x[ j + 1 ]
        if j + 1 < x.length
          return 0 if y[ j ] > x[ j + 1 ]
        end
    end
    return x.length + y.length
end
####################|||||||||||||###############################
####################|||||||||||||###############################
# 教室 きょうしつ
#####  ########  ###|||||||||||||##################  ###########
#          ###  ####|||||||||||||############/             #####
#####  ######                ||||############/ ##########  #####
#          #   #####|||||  ||||||###############````````########
###      ##  ##  ###|||  ||||||||################/  ############
######  ##  #####  #|  ||||||||||###############/      \########
#####  ############  ||||||||||||##################  #\ \#######
#          ######  #|  ||||||||||#############            ######
#####  ########  ###|||  ||||||||##################  ###########
#####  ######  #####|||||  ||||||############              #####
def alternate( s )
    h = Hash.new # character to offsets mapping
    s.each_char.with_index do | ch, ofst |
        if h.has_key? ch
            h[ ch ].push( ofst )
        else
            h[ ch ] = [ ofst ]
        end
    end
    # check all possible pairs
    keys = h.keys
    n = keys.length
    maxlen = 0
    for i in ( 0 .. n - 2 ) 
        for j in ( i + 1 .. n - 1 )
            len = checkpair( h[ keys[ i]], h[ keys[ j]])
            maxlen = len if maxlen < len
        end
    end
    maxlen
end
################################################################
################################################################
################################################################
################################################################
################################################################
################################################################
################################################################
################################################################
l = gets.strip.to_i ############################################
s = gets.chomp      ############################################ 
p alternate s                         
################################################################
################################################################
################################################################
################################################################
################################################################
################################################################
################################################################
################################################################
# Hackos:                                                   1923
# Challenges:                                          112 / 563 
# Rank:                                                    19210
# Points:                                                   2993
# 13: A certain casino uses 10 standard decks of cards mixed tog
# ether into one big deck, which we will call a superdeck. Thus,
# the superdeck has 52x10 = 520 cards, with 10 copies of each ca
# rd. How many different 10-card hands can be dealt from the sup
# erdeck? The order of the cards does not matter, nor does it ma
# tter which of the original 10 decks the cards came from. Expre
# ss your answer as a binomial coefficient
# 
# Ok if we have thus equation: x + x + x + x = 9, for all x bein
#                               1   2   3   4
# g positive integers how many solutions are there? By the way d
# on't play gambling! anyway we can write 9 as sequences of ones
# like 1 1 1 1 1 1 1 1 1, and pick 3 slots between the ones like
# 1 1 1 1 1 1 1 1 1, this will correspond to the solution:
#    ^     ^ ^       2 + 3 + 1 + 3 = 9, so in the general case w
# e have equation like: x + x + ... + x = r, there will be r - 1
#                        1   2         n
# slots, and we have to pick n - 1 of them, so the number of sol
# utions will be the combinations C( r - 1, n - 1 ). Now if we w
# ant to allow x to have zero values, we can rewrite the equatio
# n above, as: (x + 1) + ... + (x + 1) = r + n, this is equivale
#                1               n
# nt to the number of solutions of y + ... + y  = r + n, where y
#                                   1         n
# are positive integers, that is C( r + n - 1, n - 1 ). In our c
# ase every card has 10 copies so we can search the answer as th
# e number of solutions of this equation:
# x + x + ... + x = 10, where x is the number of 2c's etc. So th
#  1   2         52            1
# e number of hands is C( 10 + 52 - 1, 52 - 1 ) = C( 61, 51 ) th
# is is equal to 52*53*54*55*56*57*58*59*60*61/10! = 90177170226
################################################################
#################### 1.5 Motion with connections ###############
##///////////////###############################################
####|#######|###################################################
####|#######|####### 1.5.1: The speed of weight A is V what is  
####|#######.######################################## A ########
####|######. .###### the speed of weight B?                     
####|#####. o .#################################################
####|#####|. .|##### Because the length of the rope is the same 
####|#####|#.#|#################################################
####|#####|###|##### if we drop the left reel at distance x the
####|#...#|###|#################################################
####.     .###|##### left part of the rope will increase with x 
####.  O  .###|#################################################
####..   ..###|##### also the middle part will increase with x, 
######...#####|#################################################
#######|######|##### and the ryte side must decrease with y = 2x
#######|######|#################################################
#######|######|##### Now if we differentiate so to speak we'll   
######===####~~~################################################
######=A=####~B~#### get V = dx\dt, V = dy|dt = 2dx/dt = 2V    «
######===####~~~######### A ######## B ################### A ###
#######|########################################################
#######|########################################################
## V ##v########################################################
### A ##########################################################
################################################################
################################################################
################################################################
################################################################
################################################################
################################################################
################################################################
################################################################
