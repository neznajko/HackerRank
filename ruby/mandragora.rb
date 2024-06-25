################################################################
# www.hackerrank.com/challenges/mandragora/problem
################################################################
def mandragora( h )
    EvilForest.new( h ).journey
end
################################################################
################################################################
################################################################
################################################################
class EvilForest
    def initialize( h )
        @n = h.length
        @h = h.push( 0 ).sort
    end
    def journey
        battle_sum = @h.sum #             only battles over here
        max_experience = battle_sum #            that is correct
        for j in ( 1 .. @n - 1 ) do # I am ze best
            battle_sum -= @h[ j ] #  subtract the jth mandragora
            experience = battle_sum * ( j + 1 )
            if max_experience < experience
                max_experience = experience
            end
        end
        max_experience
    end #                                                  becoz
end
########||||||||||||||||||||||||||||||||||||||||||||||||######## か
########||||||||||||||||||||||||||||||||||||||||||||||||######## た
########||||||||||||||||                ||||||||||||||||########
########||||||||||||||||                ||||||||||||||||########
########||||||||||||||||                ||||||||||||||||########
########                                                \#######
########                                                #\######
########\#########        \#############################\#\#####
#########\########        #\#############################\#\####
##########\#######        ##\#############################\#\###
###########\######                                      \##\#\##
############\#####        \#####################        #\##\#\#
#############\####        #\####################        ##\##\#\
##############\###        ##\###################        ###\##\#
###############\##        ###\##################        ####\##\
################\        #####\################        ######\##
###############        ########\#############        #########\# z
############        ############\#########        #############\ o
########        #################\####        ################## c
########\#########################\###\######################### e
#########\#########################\###\######################## b
t = gets.strip.to_i
t.times do |t_itr|
    n = gets.strip.to_i
    puts mandragora( gets.rstrip.split.map( &:to_i ))
end
################################################################
################################################################
# 1. たなかさんは図書館に行きます。
#    Herr Tanaka geht in die Bibliothek.
# 2. 私のともだちは日本に来ます。
#    Mein Freund kommt nach Japan.
# 3. すずきさんはうちで音楽を聞きます。
#    Herr Suzuki hört zu Hause Musik.
# 4. 私は日本語をうちで話します。
#    Ich spreche zu Hause Japanisch.
# 5. 私は学校で昼ご飯を食べません。
#    Ich esse in der Schule kein Mittagessen.
################################################################
####################...,,,,,,,,,,,,,,,,----------===============
#                   .  ,               -         Congratulations
#                   .  ,               You solved this challenge
#                   .  Would you like to challenge your friends?
#                   Personne ne sait ce qui se passe aujourd'hui
#        parce que personne ne veut qu'il se passe quelque chose,
#                 en réalité on ne sait jamais ce qu'il se passe
#              on sait seulement ce que l'on veut qu'il se passe,
#                      et c'est comme ça que les choses arrivent.
#                  En 17 Lénine et ses camarades ne disaient pas:
#         Nous allons faire la révolution parce que nous voulons 
#                                                  la révolution ..
# Points:                                          933.44 / 2200
# Rank:                                                   194156
