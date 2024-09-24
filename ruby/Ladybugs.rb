################################################################
# hackerrank.com/challenges/happy-ladybugs/
################################################################
################################################################
################################################################
################################################################
################################################################
def happyLadybugs( b )
    Ladybugs.new( b ).happy?
end
################################################################
################################################################
################################################################
################################################################
GUARD = '[' #                        the ascii character after Z
NO, OK = "NO", "YES"
################################################################
class Ladybugs
    def initialize( b )
        @board = b
    end

    def off( c ) #                                        offset
        c.ord - 'A'.ord
    end

    def check #                               no undascore board
        n = @board.length
        return NO if n == 1 
        return NO if @board[ 0 ] != @board[ 1 ]
        return NO if @board[ n - 1 ] != @board[ n - 2 ]
        for j in ( 2 .. n - 3 ) do
            return NO if( @board[ j ] != @board[ j - 1 ] &&
                          @board[ j ] != @board[ j + 1 ])
        end 
        OK
    end

    def happy?
        undascore = false
        fq = Array.new( off( GUARD ), 0 )
        @board.each_char do |color|
            if color == '_'
                undascore = true
            else
                fq[ off( color )] += 1
            end
        end
        fq.each do |n|
            return NO if n == 1
        end
        return check if !undascore
        return OK
    end
end
################################################################
################################################################
################################################################
################################################################
g = gets.strip.to_i
g.times do |g_itr|       #######################################
    n = gets.strip.to_i  #######################################
    b = gets.chomp       ####################################### 
    puts happyLadybugs b #######################################
end                      #######################################
################################################################
################################################################
################################################################
################################################################
################################################################
################################################################
# Hackos:                                                   1819
# Score:                                                      30
# Rank:                                                    26606
# Points:                                                   2643
# Challenges:                                           99 / 563 
# 1.3.19*: With what minimal velocity a boy should throw a stone 
# so it can go over a house with height H and length L? Throwing
# is made from a height h, and the boy can pick any place.
#
# Here h is the boy's height, so we can assume h < H. Cos we are
# looking for minimal velocity, we have this picture:
#
#                  *
#   | h      *           *
#   v     *_________________*  - - - - - - - -
# - - - *  A_______________B  *              ^
#   |   S  _________________   *             H
#   |      _________________    *            V
# //^///////////////////////////////////////////////////////////
#   |      |<----- L ----->|
# that is the trajectory is passing through the corners A and B. 
# From previous exercises we know that the max horizontal 
# distance of an object thrown at angle α thowards the horizon 
# is: d = (Ʋ²sin2α)|g, where Ʋ is the initial velocity, so 
# maximum possible distance is when α = 45º: d = Ʋ²|g
#
# Cos of this we want the velocity at point A to be at 45º. 
# Although this is a problem from Chapter 1 Kinematics, we can 
# use as a shortcut the energy conservation equation:
# mv²|2 = mu²|2 + mg( H - h ), where v and u are the velocities
# at point S and A, zo we have:
# v² = u² + 2g( H - h ), and
# L = u²|g, zo
# v² = Lg + 2g( H - h )
# v = √{g[2( H - h ) + L]}                                     ≪
################################################################
