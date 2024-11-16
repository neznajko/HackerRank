################################################################
# Lily's Homework
################################################################
# Whenever George asks Lily to hang out, she's busy doing
# homework. George wants to help her finish it faster, but he's
# in over his head! Can you help George understand Lily's
# homework so she can hang out with him?
################################################################
# Consider an array of n distinct integers, a = [ a[0], a[1], ..
# a[n-1] ]. George can swap any two elements of the array any 
# number of times. An array is beautiful if the sum of 
# |a[i] - a[i-1]| among 0 < i < n is minimal.
# Given the array a, determine and return the minimum number of 
# swaps that should be performed in order to make the array 
# beautiful
################################################################
################################################################
################################################################
################################################################
################################################################
class Homework
    def initialize( from, to, h )
        @from = from
        @to = to
        @h = h
    end
    def exch( i, j )
        a = @from
        @h[a[i]],@h[a[j]] = @h[a[j]],@h[a[i]]
        a[i],a[j] = a[j],a[i]
    end
    def solve()
        n = 0
        @from.length.times do | i |
            f = @from[ i ]
            t = @to[ i ]
            next if f == t
            j = @h[ t ]
            exch( i, j )
            n += 1
        end
        n
    end
end
################################################################
################################################################
################################################################
################################################################
################################################################
def conshash( a )
    h = Hash.new
    a.each_with_index{| v, j | h[ v ] = j }
    h
end
################################################################
################################################################
def lilysHomework( a )
    s = a.sort
    h = conshash( a )
    b = a.dup
    r = s.reverse
    g = h.dup
    n = Homework.new( a, s, h ).solve()
    m = Homework.new( b, r, g ).solve()
    [ n, m ].min
end
################################################################
n=gets.strip.to_i###############################################
arr=gets.rstrip.split.map(&:to_i)###############################
result=lilysHomework arr########################################
puts result#####################################################
################################################################
################################################################
################################################################
################################################################
# Hackos:                                                   1963
# Score:                                                      40
# Challenges:                                          118 / 563
# Rank:                                                    16671
# Points:                                                   3163
# 1.5.18*: A bar, one end of which is hinged to a horizontal 
# plane, lies on a cylinder. The angular velocity of the bar is 
# ω. There is no slippage between the cylinder and the plane. 
# Find the dependence of the angular velocity of the cylinder on
# the angle α between the bar and the plane
################################################################
################################################################
####################/# ω ######### Let v be the speed of the ###
###################/############## cylinder's center C, and  ###
##################/############### r is its radius. Velocity ###
#################/################ of the cylinder at point  ###
################/#   ############# A is sum of two           ###
##############A/       ########### components one is due to  ###
##############/`  r     ########## its rotation the other to ###
#############/   `   v   ######### motion of its center      ###
############/#     `---> #######################################
###########/###    C    ###################      7 Ωr    #######
##########/#####       ####################     .        #######
#########/ α #####   ######################    .         #######
####    O                            ######   . α        #######
###########################################  . . . . > v #######
########################################### A            #######
################################################################
#### Here Ω is the angular speed of the cylinder, the   ########
#### direction of Ωr is parallel to the bar and without ########
#### slip its size is equal to v. The other component v ########
#### has a projection perpendicular to the bar equal to ########
#### vsinα, and becoz the bar and the cylinder are in   ########
#### contact it must be equal to the speed of the bar   ########
#### at that point ωx, where x := OA, zo:               ########
#### vsinα = ωx, Ω = v|r = ωx|rsinα,                    ########
#### from the triangle OCA we have tg(α|2) = r/x, zo    ########
#### Ω = ω|[sinα tg(α|2)], here we can use the formula: ########
#### sinα = 2sin(α|2)cos(α|2), so Ω = ω|2sin²(α|2)             »
################################################################
################################################################
################################################################
################################################################
################################################################
################################################################
################################################################
################################################################
################################################################
