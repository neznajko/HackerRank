#    #######   #######   ###    ||||||||||||||||||||||||||||||||
#                        ###    ||||||||||||||||||||||||||||||||
#    #######   #######   ###    || ||||||| ||||||| ||||||| |||||
#    #######   #######   ###    | # ||||| = ||||| \ ||||| . ||||
#    #######   #######   ###     ### ||| === ||| \ \ ||| ... |||
#    #######   #######   ###    ##### | =====       \ | ..... ||
#            | | ||      ###   ####### ======      \ \ ....... |
#    ####### |    |###   ###   ######## =====       \ \ ....... 
#    ####### |    |###   ###   ######### ====      \ \ \ .......
#    ####### |    |###   ###   ########## ===       \ \ \ ......
#    ####### |    |###   ###   ########### ==      \ \ \ \ ..... 
#            |    |            ###                      \ \ .... 
#            /\   | ________   ###                     \ \ \ ...
#    ////////  \  |   ______   ##############      == \ \ \ \ ..
#    ///////   /  ##    ____   #####  #######      === \ \ \ \ .
#    //////   / ######    __   ####    ######      ==== \ \ \ \ 
#    /////   /    ######       ####     #####      ===== \ \ \ \
#    ////   /|    | ######      ....     ....      .............
#    ///   / |    |   ######    .   .     . .      .           .
#    //   /  |    | __  ##      .    .    . .      .           .
#    /   /   |    | ____  __    .     .  .  .      .           .
#    \  /    |    | ________    .      ..   .      .           .
#     \/     |    | ________    .............      .............
#            |    |             =============      =============
#    ####### |    | ########    :::::::::::::      :::::::::::::
#    ####### |    | ########    ::::::::::         :::::::::::::
#    ####### | | || ########    :::::::::::       ::::::::::::::
#    ### ###        # ### ##    ::::::::::::::::::::::::::::::::
#    ### ###        # ### ##    ################################
# 世 界 か ら 隠 れ た 静 か な「村」。 Тихо [село], скрито от света
################################################################
################################################################
################################################################
################################################################
################################################################
################################################################
################################################################
################################################################
################################################################
################################################################
################################################################
################################################################
################################################################
# hackerrank.com/challenges/even-tree/
################################################################
# You are given a tree (a simple connected graph with no cycles).
# Find the maximum number o f edges you can remove from the tree
# to get a forest such that e a c h connected component of t h e
# forest contains an even number of nodes ...
#
# This problem is relatively easy one be coz trees are recursive
# by definition, so most o f t h e problems involving trees have
# recursive solutions. The idea is t h a t if a sub tree o f the
# root has e v e n number of nodes then we c a n remove the edge
# from the root to that sub tree
#
################################################################
################################################################
################################################################
################################################################
class Tree:
    
    def __init__( self, t_nodes, t_edges, t_from, t_to ):
        # build tree as an adjacency list
        self.adj = [[] for _ in range( t_nodes + 1 )]
        for j in range( t_edges ):
            self.adj[ t_to[ j ]].append( t_from[ j ])
        self.cut = 0 # number of removed edges

    def dfs( self, v ):
        n = 1
        for u in self.adj[ v ]:
            m = self.dfs( u )
            if m & 1 == 0: # check if m is even
                self.cut += 1
            n += m
        return n

    def MrsForester( self ):
        self.dfs( 1 )
        return self.cut
    
################################################################
################################################################
################################################################
################################################################
# 2.1.34. The a i r resistance force a c t i n g on a cyclist is
# proportional to the square of the cyclist's speed: f = αυ². On
# a h o r i z o n t a l road, the cyclist's maximum s p e e d is
# approximately 20 m/s. Estimate the proportionality coefficient
# α if the cyclist's mass together w i t h the bicycle i s 70 kg,
# a n d the coefficient of friction between the wheels and t h e
# road is 0.4.
#
# Here at maximum s p e e d there is a n equilibrium between the
# f o r c e of f r i c t i o n and t h e r e s i t a n c e force:
# μmg = αυ², α = μmg/υ² = 0.4 * 70[kg] * 10[ m/s²] / 400[m/s²] =
# = (4 * 700 / 4000)[kg/m] = (7/10)[kg/m] = 0.7[kg/m]          «
################################################################
################################################################
################################################################
################################################################
def evenForest( t_nodes, t_edges, t_from, t_to ):
    return Tree( t_nodes, t_edges, t_from, t_to ).MrsForester()
################################################################
################################################################
# Exercise 1.3.3. (a) Let A be nonempty and bounded below, a n d
# d e f i n e B = {b ∈ R : b i s a lower bound for A}. Show that
# sup B = inf A.
#
# inf A is a l o w e r bound for A, so inf A ∈ B, sup B can't be
# smaller then inf A becoz it's an upper bound f o r B, but also
# sup B can't be larger then inf A, be coz inf A is the greatest
# lower bound, zo inf A = sup B
#
# (b) Use (a) t o explain why there is no n e e d to assert that
# g r e a t e s t lower bounds exist as p a r t of the Axiom o f
# Completeness.
#
# The a x i o m states that: "Every nonempty set of real numbers
# that i s b o u n d e d above has a least u p p e r bound". The
# unnecessary assertion would look like: "Every nonempty set o f
# real numbers that is bounded below has a greatest lower bound".
# 
# from (a) if A is a n o n e m p t y set bounded bellow, t h e n 
# inf A = sub {b ∈ R: b is a lower bound for A}, s o no need for
# that axiom
################################################################
################################################################
t_nodes, t_edges = map( int, input().split()) ##################
t_from = [ 0 ] * t_edges #######################################
t_to = [ 0 ] * t_edges #########################################
for j in range( t_edges ): #####################################
    t_from[ j ], t_to[ j ] = map( int, input().split()) ########
print( evenForest( t_nodes, t_edges, t_from, t_to )) ###########
################################################################
################################################################
################################################################
################################################################
# 1. Mary watched TV for two hours yesterday
#    メアリーさんは きのう 二時間 テレビを見ました。
################################################################
# 2. Takeshi waited for Mary for one hour in front of the
#    department store.
#    たけしさんは デパートの前で 一時間 メアリーさんを待ちました。
################################################################
# 3. Sue studied Japanese at the library for about one hour
#    every day.
#    スーさんは 毎日 一時間ぐらい 図書館で 日本語を勉強します。
################################################################
################################################################
################################################################
# 39. An organization with 2n p e o p l e consists o f n married
# couples. A c o m m i t t e e of size k is selected, with a l l
# possibilities equally likely Find t h e probability that there
# are exactly j married couples within the committee.
#
# Let's try with samples regardless o f the o r d e r. The total
# n u m b e r s of different committees i s C(2n,k). There are n
# couples and we have to select j of them, this c a n be done in
# C(n,j) ways, now we are l e f t with n - j couples and have to
# select the remaining k - 2j people so that each person is from
# different couple. First w e select the couples and then pick a
# p e r s o n from e a c h one, this c a n be a c h i e v e d in
# C(n - j,k - 2j)2**(k - 2j) d i f f e r e n t ways, hence t h e 
# probability is: P = C(n,j)C(n - j,k - 2j)2**(k - 2j)/C(2n,k) «
################################################################
################################################################
################################################################
################################################################
# Hackos:                                                   2237
# Max Score:                                                  50
# Challenges:                                          149 / 563
# Rank:                                                     8751
# Points:                                                   4087
