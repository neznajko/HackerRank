########################################################
# hackerrank.com/challenges/lisa-workbook/
########################################################
########################################################
########################################################
########################################################
# 5 3
# 4 2 6 1 10
########################################################
########################################################
########################################################
########################################################
########################################################
########################################################
########################################################
########################################################
## special problem = problem's index within a chapter is
################################ same as the page number
########################################################
########################################################
########################################################
########################################################
########################################################
########################################################
########################################################
# n ################################# number of chapters
# k ############### maximum numbers of problems per page
# a ##################### number of problems per chapter
########################################################
# const ############################## 1 <= n,k,a <= 100
########################################################
def workbook( n, k, a )
    Workbook.new( k, a ).nosp
end
########################################################
# return #### number of special problems in the workbook
########################################################
########################################################
########################################################
########################################################
########################################################
class Workbook
    #
    def initialize( m, a )
        @m = m  # maximum problems per page
        @a = a  # number of chapter problems
    end
    #
    # problem - number >= 1
    def get_chapter_page( problem )
        ( problem - 1 ) / @m + 1
    end
    # page number relative to a chapter - number >= 1
    #
    def nosp
        n = 0 # output
        page = 0 # workbook page number
        chapter_page = 0 # relative page number
        @a.each do | chapter_problems | # 6
            chapter_problems.times do | off | # 4
                problem = off + 1 # 1-based 5
                chapter_page = get_chapter_page( problem ) # 2
                if page + chapter_page == problem
                    n += 1 # 2
                end
            end
            page += chapter_page # 3
        end
        n
    end
    # number of special problems
end
########################################################
########################################################
#################################    ###################
######       #    #    ##       #    ##    ##       ####
#####    #####    #    #    #####    #    ##    ########
########################################################
########################################################
########################################################
########################################################
########################################################
########################################################
########################################################
########################################################
########################################################
########################################################
########################################################
########################################################
first_multiple_input = gets.rstrip.split
n = first_multiple_input[0].to_i
k = first_multiple_input[1].to_i
arr = gets.rstrip.split.map(&:to_i)
p workbook n, k, arr
########################################################
########################################################
########################################################
########################################################
####    ####    ####    ####    ####    ####    ####
####    ####    ####    ####    ####    ####    ####
####    ####    ####    ####    ####    ####    ####
####    ####    ####    ####    ####    ####    ####    
####    ####    ####    ####    ####    ####    ####
####    ####    ####    ####    ####    ####    ####
####    ####    ####    ####    ####    ####    ####
####    ####    ####    ####    ####    ####    ####    
####    ####    ####    ####    ####    ####    ####
####    ####    ####    ####    ####    ####    ####
####    ####    ####    ####    ####    ####    ####
####    ####    ####    ####    ####    ####    ####    
####    ####    ####    ####    ####    ####    ####
####    ####    ####    ####    ####    ####    ####
####    ####    ####    ####    ####    ####    ####
####    ####    ####    ####    ####    ####    ####    
####    ####    ####    ####    ####    ####    ####
####    ####    ####    ####    ####    ####    ####
####    ####    ####    ####    ####    ####    ####
####    ####    ####    ####    ####    ####    ####    
#### Rank: 29241 ###    ####    ####    ####    ####
####    ####    #### Points: 2553 ##    ####    ####
####    ####    ####    ####    ####    ####    ####
####    #### Challenges: 96 / 563 ##    ####    ####
####    ####    ####    ####    #### Hackos: 1800 ##
####    ####    #### Score: 25  ####    ####    ####
####    ####    ####    ####    ####    ####    ####
####    ####    ####    ####    ####    ####    ####
####    ####    ####    ####    ####    ####    ####
####    ####    ####    ####    ####    ####    ####
####   A hose lying on the ground fires a water with
####    45 degrees angle with respect to the horizon,
#### with initial velocity 10 m/s. The cross-section
####  of the hose is 5 cm^2. What is the mass of the
####    ####    ####    ####   water jet in the air?
####    ####    ####    ####    ####    ####    ####
####    ####    ####    ####    ####    ####    ####
####    ####    ####    ####    ####    ####    ####
########################################################
####  ^ 
####  | y                t=T 
####  |                  .
####  |          .               .
####  |     .                         .
####  |  .                               .
####  |.                                   .
####  +--------------------------------------->
####                                       x
####  ^                 dV = svdt
####  | hose            dm = þdV
####  |    .`. s        s  - hose cross-section
####  |  .`   `.        dV - volume for time dt
####  |.`      .`       þ  - water density
####  `.     .`--->     dm - dV mass
####    `. .` vdt       
####      `            
####  vsinA - gt = vy( t )                 
####  vsinA - gT = 0                 
####  T = vsinA|g, zo                 
####
####  m = þsv(2T) = 2þsv²sinA|g
####
####  þ = 1 g/cm³( wåter )
####  s = 5 cm²
####  sinA = 1|sqrt(2)
####  v = 10 m/s
####  g = 10 m/s²
#### 
####  2sinA = sqrt(2)
####  þs = 5 g/cm
####  v²|g = 10 m = 1000 cm, zo
####  m = 5sqrt(2) kg ≈ 7 kg                      THA"TS
########################################################