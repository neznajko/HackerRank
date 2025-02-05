################################################################
# hackerrank.com/challenges/closest-numbers/
################################################################




             ###################################################
             ###################################################
             ###_____________________________________________###
             ###_____________________________________________###
             ###___________________/     ____________________###
             ###__________________/      ____________________###
             ###_________________/       ____________________###
             ###                       , `                   ###
             ###     ##############, `    `#############     ###
             ###     ##        , `       , `          ##     ###
             ###     ######, `       , `######,=================
             ##########, `       , ` \######,` `,               
             ########`       , `\/\   \###,`    ,`==============
             #########`  , `####/  \   \,`    ,`                
             ##########`#######/    \ ,`    ,`                  
             #################/     /  `,    `,                 
             ################/     /\    `,    `,               
             ###############/     / /\     `,   ,`==============
             ##############/     / /  \     \`,`================
             ##############\    / /    \     \                  
             ###############\  / /     /\     \                 
             ################\/__\    /  \     \________________
             #####################\  /   /     /              
             ######################\/___/     /
             ###########################\    /              
             ############################\  /
             #############################\/____________________
             ###################################################
             ###################################################
             ###################################################

################################################################
def closestNumbers( a )
    a.sort! {| a, b | b <=> a } #                sort in reverse
    j = a.length - 2
    mindist = a[0] - a[-1]
    stk = []
    while j >= 0
        dist = a[j] - a[j+1]
        if dist < mindist
            mindist = dist
            stk = [ a[j+1], a[j] ]
        elsif dist == mindist
            stk.push( a[j+1] )
            stk.push( a[j] )
        end
        j -= 1
    end
    stk
end
################################################################
################################################################
################################################################
################################################################
n=gets.strip.to_i###############################################
arr=gets.rstrip.split.map(&:to_i)###############################
result=closestNumbers arr#######################################
print result.join( " " )########################################
################################################################
################################################################
################################################################
################################################################
# Hackos:                                                   1949
# Score:                                                      35
# Challenges:                                          116 / 563
# Rank:                                                    17748
# Points:                                                   3088
# 1.5.16: A bar rests with its ends on the sides of a right 
# angle. The upper end of the bar is raising with speed v. Find
# how the speed of its lower end depends on time. Take the 
# moment when the upper end is at the vertex of the angle as the
# starting point of time. The length of the bar is L.
################################################################
#### ^ v                   #### Here let's say the speed of poin
###B |                     #### t A is u, then the projections o
####\                      #### f v and u over AB should be equa
#### \                     #### l becoz, the length of the bar L 
####  \ L                  #### is constant, zo:                
####   \                   #####################################
####    \                  #####################################
####     \                 #### If <OAB =: α, then we have: ####
###O######A#################### ucosα = vsinα, that is      ####
############################### u = vtgα = vx|√(L² - x²),   ####
###############################                             ####
############################### vhere x := BO = vt, zo      ####
###############################                             ####
############################### u = v²t|√(L² - v²t²)      « ####
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
