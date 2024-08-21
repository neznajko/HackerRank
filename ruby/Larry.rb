################################################################
################################################################
# www.hackerrank.com/challenges/larrys-array/
################################################################
################################################################
################################################################
################################################################
# So we have this operation:
# (ABC) -> (BCA) -> (CAB) -> (ABC) -> ..., that is a left cycle
# rotation on three numbers. The question is can we sort any
# permutation using this operation only. In this scenario: abcd,
# we can move c one position forward in two ways, that is
# a(cdb), or (bca)d. So if we use a brute force on a permutation
# of n numbers it will take approximately 2**n operations, for
# n = 1000( the max value of this problem ) this is equal to
# 10715086071862673209484250490600018105614048117055336074437503
# 88370351051124936122493198378815695858127594672917553146825187
# 14528569231404359845775746985748039345677748242309854210746050
# 62371141877954182153046474983581941267398767559165543946077062
# 914571196477686542167660429831652624386837205668069376 .. zooo
# that's not an option here
# Inversion in a permutation is a pair of numbers ( a, b ) such
# that a > b and b stands on the ryte of a, for example here:
# 1 4 5 3 2, the pair ( 5, 2 ) is an inversion. Let's look at
# the number of inversions of all permutations of ABC
# 1) ABC 0
# 2) ACB 1: C > B
# 3) BAC 1: B > A
# 4) BCA 2: B > A, C > A
# 5) CAB 2: C > A, C > B
# 6) CBA 3: C > A, C > B, B > A
################################################################
# 1, 4 and 5 are connected with left cycle rotations:
# (ABC) -> (BCA) -> (CAB)
#   0        2        2
# Similarly 2, 6 and 3:
# (ACB) -> (CBA) -> (BAC)
#   1        3        1
# We can see that whatever we do the number of inversions either
# stays the same or changes by 2, the sorted permutation:
# 1 2 3 .. . n has 0 inversions that means that if we start from
# a permutation that has odd number of inversion we can't sort 
# that permutation using the above left cycle rotation operation
#                                                         tha'ts
################################################################
################################################################
################################################################
class Node
    attr_accessor :value, :left, :ryte, :gtc
    def initialize( value )
        @value = value
        @left  = nil
        @ryte  = nil
        @gtc   = 1 #                        greater than counter
    end
end
################################################################
$ninv = 0 #                                 number of inversions
################################################################
def insert( root, value )
    return Node.new( value ) if root == nil
    if value < root.value
        root.left = insert( root.left, value )
        $ninv += root.gtc
    else
        root.ryte = insert( root.ryte, value )
        root.gtc += 1
    end
    return root
end
################################################################
################################################################
def larrysArray( a )
    root = Node.new( a[ 0 ])
    tinv = 0 #                                  total inversions
    for j in ( 1 .. a.length - 1 )
        root = insert( root, a[ j ])
        tinv += $ninv
        $ninv = 0
    end
    return "YES" if tinv & 1 == 0
    return "NO"
end
################################################################
################################################################
################################################################
################################################################
t = gets.strip.to_i ############################################
t.times do |t_itr| #############################################
    n = gets.strip.to_i ########################################
    A = gets.rstrip.split.map(&:to_i) ##########################
    puts larrysArray A #########################################
end ############################################################
################################################################
################################################################
################################################################
################################################################
# Hackos:                                                   1675
# Max Score:                                               40.00
# Challenges:                                           81 / 563
# Rank:                                                    47172
# About Meditation:   "Stars wheeled overhead, and every day was
#    as long as the life age of the earth." Imagine you know the
#             answer of every question. How would you look like?
#         You probably won't thinking very much, so this is what
#   meditation is doing it is fooling you that you have achieved
#    enlightenment by simulating the result of the enlightenment
