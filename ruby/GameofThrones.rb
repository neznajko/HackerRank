################################################################
# hackerrank.com/challenges/game-of-thrones/
################################################################
# Dothraki are planning an attack to usurp King Robert's throne.
# King Robert learns of this conspiracy from Raven and plans to
# lock the single door through which the enemy can enter his 
# kingdom.
# But, to lock the door he needs a key that is an anagram of a 
# palindrome. He starts to go through his box of strings, 
# checking to see if they can be rearranged into a palindrome. 
# Given a string, determine if it can be rearranged into a 
# palindrome. Return the string YES or NO
################################################################
# 1 <= |s| <= 10^5 
# s contains only lowercase letters
################################################################
def gameOfThrones( s )
  h = Array.new( 'z'.ord + 1 ){ 0 }
  n = 0
  s.each_byte do | ascii |
    if h[ ascii ] == 0
      h[ ascii ] = 1
      n += 1
    else
      h[ ascii ] = 0
      n -= 1
    end
  end
  return "YES" if n <= 1
  "NO"
end
################################################################
################################################################
################################################################
################################################################
#######################    #####################################
###################         ####################################
###############                                            #####
###########         #                | | ||                #####
#######            ##                | | ||                #####
###         #      ##    || | || | | | | || | || ||  ||    #####
####    #####      ##          ##################          #####
#############      ##          ######      ######          #####
#############      ##          ##################          #####
#############      ##    | | || |  | ||  | |||  || || |    #####
#############      ##    | | ||##################| || |    #####
#############      ##                ######                #####
#############      ##                ######                #####
#############      ##                ######                #####
#############      ##                ######                #####
#############      ##                """"""                #####
#############      ##                ''''''                #####
#############      #############################################
#############      #############################################
#############      #############################################
#############      #############################################
#############      #############################################
s=gets.chomp#      #############################################
p gameOfThrones s  #############################################
#############      #############################################
#############      #############################################
# A: その かばん は 二万円 でしたか。
# B: いいえ、二万円 じゃなかったです。
# A: 一万五千円 でしたか。
# B: はい、そうです。
################################################################
# A: その かさは 千三百円 でしたか。
# B: いいえ、千三円 じゃなかったです。
# A: 六百円 でしたか。
# B: はい、そうです。
################################################################
# A: その ぼうしは 二千四百 でしたか。
# B: いいえ、二千四百 じゃなかったです。
# A: 二千 でしたか。
# B: はい、そうです。
################################################################
# A: その Ｔシャツは 三千五百 でしたか。
# B: いいえ、三千五百 じゃなかったです。
# A: 六千五百 でしたか。
# B: はい、そうです。
################################################################
# A: その 時計 は 二万五千 でしたか。
# B: いいえ、二万五千 じゃなかったです。
# A: 三千 でしたか。
# B: はい、そうです。
################################################################
################################################################
################################################################
################################################################
# Hackos:                                                   1991
# Score:                                                      30
# Challenges:                                          120 / 563 
# Rank:                                                    15703
# Points:                                                   3233
# 2.1.1: According to reliable information, Baron Munchausen 
# once got stuck in a swamp and pulled himself out by his hair. 
# What laws of physics did the baron manage to violate?
#
# This is Newton's Third Law. It's interesting that this is not
# very exact law in general becoz the interaction is not
# instantaneous due to the speed of light limit. For example in
# QED( Quantum Electrodynamics ) the electromagnetic interaction
# is viewed as exchanges of virtual photons which are massless
# but carry momentum and energy. I though this might be funny,
# but let's imagine a boat in a lake, if we throw a ball from
# the boat becoz of the Third Law the boat will start moving
# in a direction opposite to the ball, but if we throw many
# balls in all directions the boat will stay still becoz the
# forces will cancel. Now we can imagine the boat as an electron
# and the balls as virtual photons, if we put another boat
# somewhere near, some of the balls will land in both boats and
# again and again becoz of that law, they will start moving
# apart from each other, the problem is that the throwing of
# balls between boats is not synchronized so there will be
# moments when a ball has landed in one of the boats while the
# corresponding ball is still flying, in these moments the third
# law doesn't hold. The more general principle which holds is
# the conservation of momentum in closed systems, so if we want
# to be more exact Baron Munchausen violates the conservation
# of momentum in closed systems
#
################################################################
################################################################
################################################################
################################################################
