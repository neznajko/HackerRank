################################################################
# www.hackerrank.com/challenges/coin-change/problem
################################################################
################################################################
################################################################
################################################################
################################################################
################################################################
################################################################
################################################################
################################################################
################################################################
################################################################
################################################################
################################################################
################################################################
################################################################
################################################################
################################################################
def getWays( s, c )
    CoinsChange.new( s, c ).change()
end
################################################################
################################################################
################################################################
################################################################
class CoinsChange
    
    def initialize( s, c )
        @s = s
        @c = c.sort
        @c.push( s + 1 ) # sentinel
        @che = Array.new( s + 1 ){ Array.new( c.length )}
    end
    
    def change
        dp( @s, 0 )
    end

    def dp( s, j )
        return 1 if s == 0
        return 0 if @c[ j ] > s
        return @che[ s ][ j ] if @che[ s ][ j ] != nil
        # 0 < @c[ j ] < s
        skp = dp( s, j + 1 )
        taike = dp( s - @c[ j ], j )
        @che[ s ][ j ] = skp + taike
    end

end
################################################################
# s = 4, c = [ 1, 2, 3 ]
################################################################
# c = [ 1, 2, 3, 5 ]                          che =    0  1  2
################################################### 0  _  _  _
################################################### 1  1  _  _
################################################### 2  2  1  _
################################################### 3  3  1  1
################################################### 4  4  1  0
################################################################
first_multiple_input = gets.rstrip.split #######################
n = first_multiple_input[0].to_i ###############################
m = first_multiple_input[1].to_i ###############################
c = gets.rstrip.split.map(&:to_i) ##############################
puts getWays n, c ##############################################
################################################################
################################################################
################################################################
################################################################
# 私は今日図書館で日本語を勉強します。
# Ich werde heute in der Bibliothek Japanisch lernen.
################################################################
# 私はよく七時ごろうちへ帰ります。 
# Ich komme oft gegen sieben Uhr nach Hause.
################################################################
#                      Congratulations You solved this challenge 
# Points:                                           655.75 / 850
# Rank:                                                   318222
