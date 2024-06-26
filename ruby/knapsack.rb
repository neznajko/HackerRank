################################################################
# www.hackerrank.com/challenges/unbounded-knapsack/problem
################################################################
def unboundedKnapsack( k, a )
    Knapsack.new( a, k ).vrooom
end
################################################################
################################################################
################################################################
################################################################
class Knapsack
    def initialize( a, k )
        @a = a.sort
        @k = k
    end
    def vrooom
        j = 0
        while j < @a.length do
            break if @k < @a[ j ]
            return @k if @k % @a[ j ] == 0
            j += 1
        end
        return 0 if j == 0
        @a = @a[ 0 .. j - 1 ]
        @n = @a.length
        @h = Array.new( @n ){ Array.new( 1 + @k, 0 )}
        dp( 0, @k )
    end
    def dp( j, k )
        return 0 if j >= @n
        return k if @a[ j ] == k
        return @h[ j ][ k ] if @h[ j ][ k ] > 0
        skp = dp( j + 1, k )
        if k > @a[ j ]
            taike = @a[ j ] + dp( j, k - @a[ j ])
        else
            taike = 0
        end
        @h[ j ][ k ] = ( k - taike < k - skp ) ? taike : skp
    end
    def debug
        p "#{@a}, #{@k}"
        @h.each do | r |
            p r
        end
    end
end
################################################################ ス
################################################################ ン
################################################################
########################################    ####################
########################################    ####################
########################################    ####################
#########                                              #########
#########                                              #########
#########                                              #########
#########                                              #########
#########                                              #########
########################################    ####################
#####                       ,`,         http     ###############
#####                     ,`   `,       s://     ###############
#####                   ,`       `,     yout     ###############
#####                  `,          `,   u.be     ###############
#####                  `,`,       ,`,   /lEw     ###############
#####                  `,`,`,   ,`,`,   mmqu     ###############
#####                  `,`,`,`,`,`,`,   JmXs     ###############
#####                  `,`,`,`,`,`,`,   ?t=2     ###############
#####                  `,`,`,`,`,`,`,   646      ###############
#####                  `,`,`,`,`,`,`,            ###############
#########################`,`,`,`,`,`############################
###########################`,`,`,`##############################
#############################`,`################################
################################################################  
################################################################
################################################################
################################################################
first_multiple_input = gets.rstrip.split #######################
n = first_multiple_input[0].to_i         #######################
k = first_multiple_input[1].to_i         #######################
arr = gets.rstrip.split.map(&:to_i)      #######################
puts unboundedKnapsack k, arr            #######################
################################################################
################################################################
# (1) わたしはおちゃを飲みます。
#     Ich trinke Tee.
#     わたしはおさけを飲みません。
#     Ich trinke keinen Alkohol.
################################################################
# (2) わたしはにほんのえいがを見ます。
#     Ich schaue japanische Filme.
#     わたしはインドのえいがを見ません。
#     Ich schaue keine indischen Filme.
################################################################
# (3) わたしはサッカーをします。
#     Ich spiele Fußball.
#     わたしはバスケットボールをしません。
#     Ich spiele keinen Basketball.
################################################################
# (4) わたしはほんを読ます。
#     Ich lese Bücher.
#     わたしは音楽ざっしを読ません。
#     Ich les keine Musikzeitschriften.
################################################################
# (5) わたしはにほんの音楽を聞きます。
#     Ich höre japanische Musik.
#     わたしはロックを聞きませ。
#     Ich höre keinen Rock.
################################################################
# *****                            You have earned your 5th star
#                                                Congratulations
#                                      You solved this challenge
# Points:                                          883.44 / 2200
# Rank:                                                   216604
