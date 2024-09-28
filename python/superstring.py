################################################################
# hackerrank.com/challenges/reduced-string/
################################################################
################################################################
################################################################
def superReducedString( s ):
    stk = [ s[ 0 ]]
    n = len( s )
    j = 1
    while j < n:
        ch = s[ j ]
        if stk and stk[ -1 ] == ch:
            stk.pop()
        else:
            stk.append( ch )
        j += 1
    if stk:
        return ''.join( stk )
    else:
        return "Empty String"
################################################################
################################################################
################################################################
################################################################
if __name__=='__main__':         ###############################
    s=input() 
    print(superReducedString(s)) ###############################
################################################################
################################################################
################################################################
################################################################
# Hackos:                                                   1845
# Score:                                                      10
# Rank:                                                    23775
# Points:                                                   2753
# Challenges:                                          103 / 563
# 1.3.30*: A projectile is fired from a gun with velocity 𐍅 at
# angle α to horizon. What time the projectile is moving towards
# the gun?
#
# The key here is to look at the distance between gun and
# projectile as a function of time, if α is 90⁰ we have this:
###############################################################=
##    .     ### d(t)                # Here the time projectile =
##    .     ###        A            # is moving to gun is #####=
##    .     ###        `            # between A and B #########=
##    n     ###    `       `        ###########################=
##    u     ###  `           `      ###########################=
##    g     ### `             `B  t ###########################=
###############################################################=
# if α is let's say 45° we'll have thus:
###############################################################=
##                     CK ### d(t)              # Here d(t) is =
##              .      ET ###                   # always ######=
##         .         . "" ###               `   # increasing ##=
##      .               . ###        `          # so the time #=
##     n                  ###    `              # is 0 ########=
##   u                    ###  `                ###############=
## g                      ### `               t ###############=
###############################################################=
###############################################################=
# So there must be some angle Ɣ bellow which the time of the
# projectile moving to gun ŧ is 0. Let's say the angle α is 
# between Ɣ and 90°. We'll have this picture:
################################################################
##                      ## d(t)                      `        ##
##                      ##                          `         ##
##                      ##          A              `          ##
##           . A        ##         `              `           ##
##         .   .        ##      `     `         `             ##
##       .       .      ##    `         `     `               ##
##      .         . B   ##  `             ` `                 ##
##     .           .    ## `               B                  ##
##    .             .   ##`                                 t ##
##   n                  ########################################
##  u                   ## Where the maximum and minimum #######
## g                    ## distance is around points A and B ###
########################## so the desired time is the interval #
## where d(t) is decreasing. ###################################
################################################################
#### x(t) = 𐍅tcosα
#### y(t) = 𐍅tsinα - (g|2)t²
####
#### d²(t) = x²(t) + y²(t) = 𐍅²t²cos²α + 𐍅²t²sin²α -
####                         - 𐍅gt³sinα + (g²|4)t⁴ =
####       = 𐍅²t² - 𐍅gt³sinα + (g²|4)t⁴ 
#### Cos we are interested in the difference between times at
#### the min an max not at their values we can look at the first
#### derivative of d²(t):
#### d|dt(d²(t)) = 2𐍅²t - 3𐍅gt²sinα + g²t³ = 0
#### g²t² - 3𐍅gtsinα + 2𐍅² = (gt)² - 2(gt)(3𐍅sinα|2) + 2𐍅² =
#### (gt)² - 2(gt)(3𐍅sinα|2) + 9𐍅²sin²α|4 - 9𐍅²sin²α|4 + 2𐍅² =
#### (gt - 3𐍅sinα|2)² - (𐍅²|4)(9sin²α - 8) = 0, zo
#### gt₁₂ = 3𐍅sinα|2 ∓ (𐍅|2)√(9sin²α - 8), tha'ts
#### ŧ = t₂ - t₁ = (𐍅|g)√(9sin²α - 8)                          «
#### The angle Ɣ we find from the condition 9sin²α - 8 ≥ 0:
#### sinƔ = √(8|9)                                             «
################################################################

