################################################################
# hackerrank.com/challenges/insertionsort2/
################################################################
################################################################
################################################################
################################################################
def display( a )
    puts a.join(' ')
end
################################################################
# 3 4 5 6 7 2 1, key = 6
#     j 
# 0 1 2 3 4 5 6
#         i 
def insertionSort2( n, a )
    i = 1
    while i < n do 
        key = a[ i ]
        j = i - 1
        while j >= 0 and a[ j ] > key do
            a[ j + 1 ] = a[ j ]
            # 3: 3 4 7 7 6 2 1                            becoz?
            # 5: 3 4 5 7 7 2 1
            j -= 1
        end
        a[ j + 1 ] = key
        display( a )
        # 1: 3 4 7 5 6 2 1                            becoz!
        # 2: 3 4 7 5 6 2 1 becoz..
        # 4: 3 4 5 7 6 2 1  
        # 6: 3 4 5 6 7 2 1                      becoz!?..
        i += 1
    end
end
################################################################
################################################################
################################################################
################################################################
n=gets.strip.to_i ##############################################
arr=gets.rstrip.split.map(&:to_i)
insertionSort2 n, arr ##########################################
################################################################
################################################################
################################################################
################################################################
# Hackos:                                                   1871
# Challenges:                                          106 / 563
# Rank:                                                    21851
# Points:                                                   2843
# Score:                                                      30
# 1.4.6*: An iceboat is like a sailing sled. It can move only
# at a line directed by its skates. The wind is blowing with
# velocity υ perpendicular to the direction of the iceboat.
# The sail is tilted at 30º to its direction. What velocity the
# iceboat can't exceed with that wind?
#                                                       υ U+03C5 
#     .
#       .      ---+---            Zo if the wind was blowing
#         .       |              parallel to the sail the iceboat
#           .     |              wont move at all, zo vheneva 
#       30º   .  ---             there is a perpendicular 
#         /|||||.|||||||||||\    component ov wind with respect
#     ======= D ==o============  of the sail the iceboat will
#         \|||||||||||||||||/    moo, becoz ..
#     ^          ---
#     | υ         |
#     |           |
#     |        ---+---                                  
#     |                                                 ν U+03BD
#
# Let's look from the point of view of the iceboat, and let's
# suppose the iceboat is moving with some small velocity ν, then
# the wind and the sail will look like thus:
#     .                                                 º U+00BA
#       .                 
#      >  .               Zo if ν is small then the relative
#     -ν    .             velocity of the wind will have a
#  > > _____> .           perpendicular component so the boat
#  υ-ν \   |υ   .         should start moving in a system where
#       \  |      .       the iceboat is already moving, that is
#        \ |        .     its velocity should in>r>ase, until
#         \|    30º   .   the relative velocity υ-ν is parallel 
#     ========================= to boat's sail. That is:
#
# tg30º = υ | ν, zo ν = υ(ctg30º) = √(3)υ                 tha'ts
################################################################
#
#
#
#
