################################################################
# hackerrank.com/challenges/kaprekar-numbers/
################################################################
################################################################
################################################################
################################################################
def get_nfd( n ) # get number of digits
    nfd = 1
    while true do
        n /= 10
        break if n == 0
        nfd += 1
    end
    nfd
end
################################################################
################################################################
def Kaprekar?( n )
    m = 10 ** get_nfd( n )
    n2 = n ** 2
    a = n2 / m
    b = n2 % m
    a + b == n
end
###############################################################_
################################################################
################################################################
################################################################
################################################################
################################################################
################################################################
################################################################
################################################################
#
# In throwing  dice 6n times, what is the probability of getting
# each face  n  times?  Use Stirling's  formula to estimate this
# probability for large n.
#
#           This problem has no answer so I might get it wrong:)
#
# 1 2 3 4 5 6 7 8 9 ... 6n                          - time slots
#
# N = 6^( 6n ) - number of all outcomes, cos each slot might has
#                6 states corresponding to each face of the dice
#
#  How many times we can split a population of n elements into k
# groups of n1, n2, .., nk elements[ sum( nj ) = n ]? Tha'ts the
#         generalization of the binomial coefficients, so called
#                                       multinomial coefficiens:
#
#      C = n! / n1!n2!..nk!, it can be proven by consequentially
#      asking how many ways we can chose n1 from n, then n2 from
#                                                   n - n1, etc.
#
#   In this case if all subgroups have same size equal to n, the
#  multinomial formula will give the number of positive outcomes
#
#                 A = ( 6n )! / ( n! )^6, so the probability is:
#
#            P = A / N = ( 6n )! / [( n! )^6 * 6^( 6n )], tha'ts
#
#  The Stirling formula is: n! ~ sqrt( 2pi*n )( n / e )^n, where
#                   e is the base of all natural logarithms,  ..
# ( after 2 hours )
#
#      .., zo the probability is proportional to 1 / n^( 5 / 2 )
#
################################################################
################################################################
################################################################
################################################################
def kaprekarNumbers( p, q )
    ls = []
    for n in ( p .. q ) do
        ls.push( n ) if Kaprekar?( n )
    end
    if ls.empty?
        print "INVALID RANGE"
    else
        print ls.join( " " )
    end
end
################################################################
################################################################
################################################################
################################################################
p = gets.strip.to_i  
q = gets.strip.to_i   ##########################################
kaprekarNumbers p, q  ##########################################
###################   ##########################################
###################   ##########################################
###################   ##########################################
###################   ##########################################
###################   ##########################################
###################   ##########################################
###################   ##########################################
###################   ##########################################
# Hackos:             1724
# Max Score:          30
# Challenges:         90 / 563
# Points:             2418
# Rank:               33962
