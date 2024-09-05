################################################################
# hackerrank.com/challenges/jumping-on-the-clouds/
################################################################
################################################################
################################################################
################################################################
def jumpingOnClouds( c )
    c.push( 1 ) #                                      add guard
    nfj = 0 #                                    number of jumps
    nf0 = 0 #                                     number of nils
    nf1 = -1 #                                    number of ones
    c.each do | u |
        if u == 1
            nfj += nf0 / 2
            nf1 += 1
            nf0 = 0
        else
            nf0 += 1
        end
    end
    nfj + nf1 #                              add jumps over ones
end
################################################################
################################################################
################################################################
################################################################
n = gets.strip.to_i               ##############################
c = gets.rstrip.split.map(&:to_i) ##############################
puts jumpingOnClouds c            ##############################
################################################################
################################################################
################################################################
################################################################
# Hackos:                                                   1717
# Max Score:                                                  20
# Challenges:                                           86 / 563
# Points:                                                   2323
# Rank:                                                    38210
# Why: there are certain people, using insults non stop? Because
# if you say someone is mouse you actually say I'm a lion, tiger
# panther, gorilla, eagle etc. but it is not working you go back
# at home and it's the same old ass hole looking at you from the
#                           mirror, that's why they overuse them
