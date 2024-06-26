################################################################
################################################################
################################################################
################################################################
# www.hackerrank.com/challenges/fibonacci-modified/problem
################################################################
################################################################
################################################################
################################################################
################################################################
# (1) 四時半にうちで音楽を聞きます。
#     Ich werde um halb fűnf zu Hause Musik hőren.
################################################################
################################################################
################################################################
################################################################
# (2) 土曜日に学校でテニスをします。 
#     Am Samstag spiele ich in der Schule Tennis.
################################################################
################################################################
# (3) 五時にマクドナルドでハンバーガーを食べます。
#     Ich esse einen Hamburger um fűnf Uhr bei McDonald's.
################################################################
################################################################
################################################################
################################################################
################################################################
# (4) 三時に喫茶店でコーヒーをのみます。
#     Um drei Uhr trinke ich im Café Kaffee.
################################################################
################################################################
# (5) 今晩にうちでテレビをみます。
#     Heute Abend sehe ich zu Hause fern.
################################################################
################################################################
################################################################
################################################################
# (6) 毎日大学で日本語を話します。 
#     Ich spreche jeden Tag an der Universität Japanisch.
################################################################
################################################################
def fibonacciModified( t1, t2, n )
    t = Array.new( n + 1 )
    t[ 1 ] = t1
    t[ 2 ] = t2
    for j in ( 3 .. n )
        t[ j ] = t[ j - 2 ] + t[ j - 1 ] * t[ j - 1 ]
    end
    t[ n ]
end
################################################################
################################################################
################################################################
################################################################
################################################################
first_multiple_input = gets.rstrip.split #######################
t1 = first_multiple_input[0].to_i ##############################
t2 = first_multiple_input[1].to_i ##############################
n = first_multiple_input[2].to_i ###############################
puts fibonacciModified t1, t2, n ###############################
################################################################
################################################################
################################################################
################################################################
################################################################
#                                                Congratulations
#                                      You solved this challenge
#                   Would you like to challenge your friends? ..
# Points:                                           775.75 / 850
# Rank:                                                   266828
