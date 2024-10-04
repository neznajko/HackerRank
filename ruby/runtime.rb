################################################################
# hackerrank.com/challenges/runningtime/
################################################################
################################################################
################################################################
################################################################
################################################################
################################################################
################################################################
def runningTime( a )
    # OK return the number of shifts( nfs ) for insertion sort
    nfs = 0 # ¯dzerØ
    # insertion sort algorithm( nevA beĠınze )
    #
    n = a.length
    i = 1
    while i < n
        key = a[ i ]
        j = i - 1
        while j >= 0 and a[ j ] > key
            # shift
            nfs += 1
            a[ j + 1 ] = a[ j ]
            j -= 1
        end
        # insert
        a[ j + 1 ] = key
        i += 1
    end
    nfs
end
########################################################    ####
########################################################    ####
########################################################    ####
########################################################    ####
n=gets.strip.to_i                 ##############################
arr=gets.rstrip.split.map(&:to_i) ##############################
puts runningTime arr
################################################################
################################################################
################################################################
################################################################
################################################################
# Hackos:                                                   1885
# Score:                                                      30
# Challenges:                                          108 / 563 
# Rank:                                                    20702
# Points:                                                   2903
# 1.4.7*: What is the duration of a flight from ℋ to ℳ and back,
# if the flight path is a straight line and there is a constant
# wind blowing with velocity υ at angle α to it? The relative
# velocity of the plane with respect of the wind is ν. The ℋℳ 
# length is L. At what direction of the wind the duration is 
# maximum?
################################################################
# Here the most difficult part is how to draw the picture:
#       to ℳ
#                                  Here ∠OCA = α is the angle,
#          |                       OA = OD = ν is the relative
#         A|############           velocity of the plane with
#        ##`            ###        respect to the wind, which is
#      ##  |`              ##      the radius of the ## circle,
#    ##    | `               ##    #############################
#    ##    |  `              ##    CO = υ is the wind's velocity
#  ##      |   `               ##  #############################
#  ##      |    `              ##  To find the veolicties of the
#  ##     B|-----.O            ##  plane to ℳ and ℋ we have to
#  ##      |α  .  `            ##  add υ and ν as vectors, zo ..
#  ##      | .   `             ##  #############################
#  ##     C.    `              ##  AC =: ν₁ is the velocity to ℳ
#    ##    |   `             ##    and DC =: ν₂ to ℋ
#    ##    |  `              ##    #############################
#      ##  | `             ##      Now we have to find  
#        ###`           ###        expressions for ν₁ and ν₂ as
#         D|############           functions of υ, ν, and α
#          |
#
#       to ℋ
#
################################################################
# from triangle COB we have
# CB = υcosα, and
# BO = υsinα, zo
################################################################
# AB = BD = √(ν² - BO²) = √(ν² - υ²sin²α), and
# ν₁ = AB + BC = √(ν² - υ²sin²α) + υcosα
# ν₂ = BD - BC = √(ν² - υ²sin²α) - υcosα,
# zo the time of flight is:
#
# t = t₁ + t₂ = L|ν₁ + L|ν₂ = L(1|ν₁ + 1|ν₂) =
#   = L{1|[√(ν² - υ²sin²α) + υcosα] + 
#     + 1|[√(ν² - υ²sin²α) - υcosα]} =
#   = 2L√(ν² - υ²sin²α)|(ν² - υ²sin²α - υ²cos²α) =
#   = 2L√(ν² - υ²sin²α)|(ν² - υ²)                              «
#
# t will be maximum at α = 0                                   «   
################################################################
#                                                         tha'ts
#
#
#
