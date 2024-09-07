################################################################
# hackerrank.com/challenges/taum-and-bday/
################################################################
#
# Taum is planning  t o  celebrate  the  birthday of his friend,
# Diksha. There are two types  o f  gifts that Diksha wants from
# Taum : one is black and the other is white. To make her happy,
# Taum  h a s  to  b u y  black gifts  a n d  white gifts ......
#
################################################################
################################################################
################################################################
################################################################

def taumBday( b, w, bcost, wcost, repaint )
    # check check
    wcost = [ wcost, bcost + repaint ].min
    bcost = [ bcost, wcost + repaint ].min
    b * bcost + w * wcost
end

################################################################
################################################################
################################################################
################################################################
t = gets.strip.to_i                           ##################
t.times do |t_itr|                            ##################
    first_multiple_input = gets.rstrip.split  ##################
    b = first_multiple_input[0].to_i          ##################
    w = first_multiple_input[1].to_i          ##################
    second_multiple_input = gets.rstrip.split ##################
    bc = second_multiple_input[0].to_i        ##################
    wc = second_multiple_input[1].to_i        ##################
    z = second_multiple_input[2].to_i         ##################
    p taumBday b, w, bc, wc, z                ##################
end
################################################################
################################################################
################################################################
################################################################
# Hackos:                                                   1724
# Max Score:                                                  25
# Challenges:                                           89 / 563 
# Points:                                                   2388
# Rank:                                                    35146
# Zo:, what is the probability of picking a number between 1 and
#       1000 such that the last two digits of its cube are ones?
#
#                 Ok the number might look like this: abc, where
#                            0 <= a, b, c <= 9, zo we can write:
#
# abc**3 = ( a*100 + b*10 + c )**3 = (( a*10 + b )*10 + c )**3 =
#
#            [( a*10 + b )**3 ]1000 + 3[( a*10 + b )**2 ]100*c +
#
#     3( a*10 + b )10( c**2 ) + c**3, using the binomial formula
#
#    ( d + e )**3 = d**3 + 3d**2( e ) + 3d( e**2 ) + e**3, zo ..
#
#     .. the fst two terms that has 1000 and 100 wont affect the
#                              last two digits, the 3rd term is:
#
#      3( a*10 + b )10( c**2 ) = 3a100c**2 + 3b10c**2, and again
#                  here we discard the 100 term and end up with:
#  ( 3bc**2 )10 + c**3 this number should end with 11, thus c**3 
#       has to be equal to 1, now we are looking for b such that
#                                                3b ends with 1:
# 3 * 0 = 0
# 3 * 1 = 1
# 3 * 2 = 6
# 3 * 3 = 9
# 3 * 4 = 12
# 3 * 5 = 15
# 3 * 6 = 18
# 3 * 7 = 21 tha'ts!
# 3 * 8 = 24
# 3 * 9 = 27
#
#     ok, b = 7 and c = 1 zo all numbers abc ending with 71 will
#                         have its cube ending with 11, that is:
#      071, 171, 271, 371, 471, 571, 671, 771, 871, 971, totally
#                              10 numbers, zo the probability is
#
#                                           P = 10 / 1000 = 0.01
