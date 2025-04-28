################\\\\\\\\\\\\\\\\\\\\\\\\\########     ##     ###
################\\\\\\\\\\\\\\\\\\\\\\\\\###############     ###
################\\\\\\\\\\\\\\\\\\\\\\\\\###############     ###
################\\\\\\\\\\\\\\\\\\\\\\\\\#######################        
################\\\\\\\\\\\\\\\\\\\\\\\\\####################### 
################\\\\\\\\\\\\\\\\\\\\\\\\\####################### 
################\\\\\\\\\\\\\\\\\\\\\\\\\####################### 
##### .  .  .  .  .  .  .  . \\\\    .`  /  `    \       9 #####
#####                        \\\\   .`  /     `   \        #####
#####     ######\\\\\\\\     \\\\  .` \\\#############     #####
#####     ######\\\\\\\\    /\\\\ .`  \\\######   ` \      #####
##### A   ##############   / ####.`  /#########     `\   #######
#####                     /  ####`  / ##########################
#####`.                  /   ####  /  ##               \`#######
#####  `. ##############/    ##__ /       4             \  _____
#####    `##############     ##__/    _____  ______      \______
#####     ##############     ##__     ___      __      _________
#####        `.      /       ##__     _____          ___________
#####          `.   /        ##__     _______      _____________
#####     ##############     ##__     _____          ___________
#####\    ############## B   ##__     ___      __      _________
##### \ 2 ###########`.      ##__ D   _      ______      _______
####   \ ############  `.  ######     ###  ##########      ##///
#######################################################  ###////
###########################################################///// 
##########################################################//////        
############ ###### ###### ###### #######################/////// 
###########   ####   ####   ####   #####################////////
##########     ##     ##     ##     ###################/////////
# 私 は 自 分 の「服」が 大 好 き で す。 Обичам [ дрехите ] си
################################################################
################################################################
################################################################
################################################################
# hackerrank.com/challenges/torque-and-development/
################################################################
# Determine the minimum c o s t to provide library access to all 
# citizens of HackerLand.There are n cities numbered from 1 to n.  
# Currently t h e r e are n o libraries a n d the cities are not 
# connected. Bidirectional roads m a y be built between any city 
# pair listed in cities. A citizen h a s access t o a library if:
# - Their city contains a library.
# - They can travel by road from their city to a city containing 
#   a library. 
# ..
################################################################
################################################################
################################################################
################################################################
# So basically what is the problem; a graph is given, where each 
# vertex represents a city. If t w o cities are connected in the
# graph, w e can build a r o a d between them for cost croad. In
# each city we can build a l i b r a r y for cost clib. Zo t h e
# question is what is the minimum cost so that every citizen can
# have access to a library?
#
# There is a trivial solution if clib <= croad, then build a lib
# in every city. For other cases let's say we have such graph:
#
# 1--2 5--6 8  There a r e three connected sub-graphs, s o there 
# |\      |    must be at least 3 libs. If we want t o keep just
# | \     |    one l i b in a sub-graph, then we have to discard
# 3--4    7    unnecessary edges keeping the sub-graph connected
#              that will leave u s with a tree that has n[j] - 1 
# edges, where n[j] is the number of cities in the jth sub-graph
# so the total cost is sum{j=1,N}(clib + croad(n[j] - 1)), where
# N is t h e number of sub-graphs. And this will b e the minimum,
# cost becoz if we want t o split a connected sub-graph with two
# libs and remove one road the diff will b e clib - croad, which
# is positive, that is w i l l cost more. If the whole graph was
# connected a n d we need o n e lib, the tree will contain n - 1 
# edges, if the graph h a s two sub-graphs we have to remove one
# edge so the total cost will be 2clibs + (n - 2)croad, so if we
# have found t h a t there are N sub-graphs the formula will b e:
# Nclibs + (n - N)croad
################################################################
################################################################
################################################################
################################################################
def construct_adjacency_list( n, cities )
    # cities are numbered from 1 to n( 1-based index )
    adj = Array.new( n + 1 ) {[]}
    for u, v in cities do
        adj[ u ].push( v )
        adj[ v ].push( u )
    end
    adj
end
################################################################
################################################################
################################################################
################################################################
def construct_visited_list( n )
    Array.new( n + 1, false )
end
################################################################
################################################################
################################################################
################################################################
def explore( v, adj, vztd )
    vztd[ v ] = true
    for u in adj[ v ]
        next if vztd[ u ]
        explore( u, adj, vztd )
    end
end
################################################################
################################################################
################################################################
################################################################
# 2.1.28: On an icy section of t h e highway, the coefficient of
# friction between the wheels and the road i s ten times smaller
# than on a non-icy section. By w h a t factor should the driver
# reduce the car’s speed t o ensure the braking distance remains
# the same as on a non-icy road?
#
# Ok let t h e initial velocity is υ, if the friction coeff is μ,
# then the acceleration of the car is equal to: a = μg. From the
# e  q  u  a  t  i  o  n  s  x = υt - at²/2, υ = at, w e g  e  t
# x = at²/2 = υ²/2a = υ²/2μg, z o w e h  a  v  e υ₁²/μ₁ = υ₂²/μ₂,
# where υ₁ is the s p e e d in normal conditions and υ₂ on i c y
# section, zo υ₂ = υ₁√(μ₂/μ₁) = υ₁/√10
################################################################
################################################################
################################################################
################################################################
def dfs( n, adj )
    cc = 0
    vztd = construct_visited_list( n )
    for v in 1..n do
        next if vztd[ v ]
        cc += 1
        explore( v, adj, vztd )
    end 
    cc
end
################################################################
################################################################
################################################################
################################################################
# 1. Yumi did not take pictures at all
#    ゆみさんは ぜんぜん 写真を 取りませんでした。
# 2. I often ate hamburgers when I was a child
#    私は 子供の時、よく ハンバーガーを 食べました。
# 3. Takeshi did not study much when he was in high school
#    たけしさんは 高校の時、あまり勉強 しませんでした。
################################################################
################################################################
################################################################
################################################################
def roadsAndLibraries( n, clib, croad, cities )
    return n * clib if clib <= croad
    adj = construct_adjacency_list( n, cities )
    cc = dfs( n, adj )
    cc * clib + ( n - cc ) * croad
end
################################################################
################################################################
################################################################
################################################################
q = gets.to_i
n, m, clib, croad = gets.split.map( &:to_i )
cities = Array.new( m )
m.times do | j |
    cities[ j ] = gets.split.map( &:to_i )
end
p roadsAndLibraries n, clib, croad, cities
################################################################
################################################################
################################################################
################################################################
# 35. A random 13-card hand is d e a l t from a standard deck of 
# cards. What is the probability that the hand contains at least 
# 3 cards of every suit?
#
# So we are looking for NO-TRUMP bidding hands like: 
# 4c 3d 3h 3s
# 3c 4d 3h 3s
# 3c 3d 4h 3s
# 3c 3d 3h 4s, e a c h one we can pick in C(13,4)C(13,3)**3 ways,
# so the probability is P = 4C(13,4)C(13,3)**3/C(52,13)
################################################################
################################################################
################################################################
################################################################
# 36. A g r o u p of 30 dice are thrown. What is the probability 
# that 5 of each of the values 1, 2, 3, 4, 5, 6 appear?
#
# This is a bit problematic becoz if order matters it's easy t o
# calculate the number o f all possible outcomes: 6**30, but not
# so obvious how to get the number of all positive outcomes, and
# vice versa if order doesn't matter then the number of positive
# outcomes is just 1, but the number of all cases is unclear. So
# one approach i s to s t a r t with the sorted positive outcome:
# 1 1 1 1 1 2 2 2 2 2 3 3 3 3 3 4 4 4 4 4 5 5 5 5 5 6 6 6 6 6,
# and mix it up, counting all permutations we'll get 30!, but we
# have to divide t h e different groups of same numbers so we'll
# h a v e 30!/(5!)**6 positive outcomes, and the probability i s:
# P = 30!/((5!)**6)6**30
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
# Challenges:                                          147 / 563
# Rank:                                                     9436
# Points:                                                   3972
# Score:                                                      30
# Hackos:                                                   2195
