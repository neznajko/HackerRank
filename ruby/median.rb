################################################################
################################################################
################################################################
################################################################
# hackerrank.com/challenges/fraudulent-activity-notifications/
################################################################
################################################################
# log: There is a test case with x.length=200000 and d=10000
# which my opponent didn't find, luckily .., that is which I
# didn't pass, zo the problem might be in the median function
# which is using sorting, zo I have to change the pawn capture, 
# knight recapture ] variation [
###########################################beco#################
class Bucket               #          #       z
    attr_accessor :siz     #          #
    def initialize(a=[] )  #          #       2. Nf3 Nf6
        @h = Hash.new { 0} # 1. e4 e5 #
        @siz = 0           #          #
        fill( a)           #          #
###########################'##########"#########################
    end                        #
    def insert( key, value=1 ) # 
       @h[ key] += value       #
       @siz += value           #
    end                        #                        17. Qh8#
###############################|################################
    def pull( key, value=1 )
        @h[ key] -= value
        @siz -= value
        @h.delete( key ) if @h[ key] < 1
    end
################################################################
    def has_key?( key )
        @h.has_key?( key )
    end
################################################################
    def get( key )
        @h[ key ]
    end
################################################################
    def fill( a )
        a.each do |key|
            insert( key)
        end
    end
################################################################
    def keys
        @h.keys
    end
################################################################
end
################################################################
################################################################
################################################################
################################################################
class Ac4ivi4y
    def initialize( x, d )
        @left = Bucket.new( x[ 0 ..d -1]) 
        @ryte = split
        @x = x
        @d = d
    end
    def split
        ryte = Bucket.new
        halflife = @left.siz / 2
        keys = @left.keys
        ( keys.max ).downto( keys.min ) do |key|
            break if halflife == 0
            next if not @left.has_key?( key )
            mass = [ halflife, @left.get( key) ].min
            @left.pull( key, mass )
            ryte.insert( key, mass )    
            halflife -= mass
        end
        ryte
    end
    def median
        if @left.siz > @ryte.siz
            return @left.keys.max
        end
        if @left.siz < @ryte.siz
            return @ryte.keys.min
        end
        ( @left.keys.max + @ryte.keys.min )/ 2.0
    end
    def remov( y )
        if @left.has_key?( y )
            @left.pull( y )
        else
            @ryte.pull( y )
        end
        make_it_happen
    end
    def add( y )
        if y < @left.keys.max
            @left.insert( y )
        else
            @ryte.insert( y )
        end
        make_it_happen
    end
    def make_it_happen
        if @left.siz - @ryte.siz > 1
            y = @left.keys.max
            @left.pull( y )
            @ryte.insert( y )
        elsif @ryte.siz - @left.siz > 1
            y = @ryte.keys.min
            @ryte.pull( y )
            @left.insert( y )
        end
    end
    def count
        c = 0
        i = 0
        j = @d
        while j < @x.length
            if @x[ j] >= 2 * median
                c += 1
            end
            remov( @x[ i])
            add( @x[ j])
            i += 1
            j += 1
        end
        c
    end
end
################################################################
################################################################
################################################################
################################################################
################################################################
def activityNotifications( x, d )
    Ac4ivi4y.new( x, d ).count
end
################################################################
################################################################
################################################################
################################################################
first_multiple_input=gets.rstrip.split##########################
n=first_multiple_input[0].to_i##################################
d=first_multiple_input[1].to_i##################################
expenditure=gets.rstrip.split.map(&:to_i)#######################
result=activityNotifications expenditure,d######################
puts result#####################################################
################################################################
################################################################
################################################################
################################################################
################################################################
################################################################
################################################################
################################################################
# Hackos:                                                   1899
# Score:                                                      40
# Challenges:                                          110 / 563 
# Rank:                                                    19718
# Points:                                                   2958
# 1.4.8: In an  elastic  hit of a ball in a non moving wall, the
# velocity v will change  only its direction. What is the change
# if the wall is  moving a) opposite to v with velocity u, b) in
# the same direction with velocity w < v?
################################################################
# v         | Ok  this is the football player problem, the 4rick
# o---->    | here is  to view  the problem from the moving wall
#           | perspctv and  then go back to the non moving systm
#           | 
#           | 
############[ thus is the positive direction ]#######>>>>>>>>>>>
# a)        |non ¦        a) |movi¦ Here the  wall is not moving
# v         |movi¦ v + u     |ng w¦ so the ball velocity will be
# o---->    |ng s¦ o------>  |all ¦ the   same   in   size   and
#        u  |ystm¦  -v - u   |pers¦ opposite in direction
#        <--|    ¦ <------o  |pctv¦
################################################################
# Going back to the NMS the bouncing back ball will have vlocity
# -(v + u) -u, zo the  change is -(v + u) - u - v, what is this?
# -2(v + u)!                                                   «
################################################################
# The case b) is  similar  we  need to change only u with -w and
# get -2(v - w)                                                «
################################################################
#                                                          becoz
#
