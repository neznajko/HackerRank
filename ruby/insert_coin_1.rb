################################################################
# hackerrank.com/challenges/insertionsort1/
################################################################
################################################################
################################################################
################################################################
def dump( a )
    puts a.join(' ')
end
################################################################
################################################################
# 2 4 6 8 3
#
# 0 1 2 3 4
################################################################
def insertionSort1( n, a )
    key = a[ -1 ] # 3
    j = n - 2 # 3
    while j >= 0 && a[ j ] > key do
        a[ j + 1 ] = a[ j ]
        dump( a )
        # 2 4 6 8 8
        # 2 4 6 6 8
        # 2 4 4 6 8
        j -= 1 # 2 1 0
    end
    a[ j + 1 ] = key
    dump( a )
    # 2 3 4 6 8
end
################################################################
################################################################
################################################################
################################################################
n=gets.strip.to_i                 ############################## 
arr=gets.rstrip.split.map(&:to_i) 
insertionSort1 n,arr              ##############################
################################################################
################################################################
################################################################
################################################################
# Hackos:                                                   1864
# Score:                                                      30
# Challenges:                                          105 / 563
# Rank:                                                    22469
# Points:                                                   2813
# 1.4.3: A speck of dust( speck A ) is in rest, while all other
# specks are moving in directions having velocities proportional 
# to their distance from A. What picture an observer moving with 
# some other speck, say B, will see?
################################################################
# Zo because of the size of the specks relative to dust we can 
# think of an infinite large dust scenario. We can also think of
# proportionality factor as being equal to 1, that is the radius 
################################################################
# vector from A to B per second is same as the velocity of B, 
# cos we can always redefine the units of distance. Zo all 
# points being on a same distance from B will have radii R:
################################################################
# >     >     >        >       >  
# R_a = R_b + R, where R_a and R_b are the distances from A and
# B respectively, the same will be true for velocities:
################################################################
# >     >     >
# V_a = V_b + V, zo the relative velocity of all specks being on
# an equal distance from B, is:
################################################################
# >   >     >  
# V = V_a - V_b, that is an observer moving with B will see the 
# same picture as an observer from A                      tha'ts
################################################################
