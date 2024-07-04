################################################################
################################################################
################################################################
################################################################
I, J = 0, 1
################################################################
################################################################
################################################################
################################################################
def crosswordPuzzle( crossword, words )
    Puzzle.new( crossword, words ).vrooom
end
################################################################
################################################################
################################################################
################################################################
class Cross
    attr_accessor :start, :finish, :length, :current_word
    def initialize( start, finish )
        @start = start
        @finish = finish
        @length = -1
        @current_word = ""
    end
end
################################################################
################################################################
class HCross < Cross
    attr_accessor :bufr
    def initialize( start, finish )
        super( start, finish )
        @length = finish[ J ] - start[ J ] + 1
        @bufr = '.' * @length
    end
    def match_current_word
        Regexp.new( @bufr ).match?( @current_word )
    end
end
################################################################
################################################################
class VCross < Cross
    attr_accessor :intasectn
    def initialize( start, finish )
        super( start, finish )
        @length = finish[ I ] - start[ I ] + 1
        @intasectn = []
    end
    def apply_current_word
        @intasectn.each do | node, i, j |
            node.bufr[ j ] = @current_word[ i ]
        end
    end
end
################################################################
################################################################
class Puzzle
    SIZ = 10
    def initialize( crossword, words )
        @crossword = crossword
        @d = consd( words )
        @h, @v = cons_nodes
    end
    ############################################################
    # construct horizontal and vertical graph nodes
    def cons_nodes
        h, v = getcross
        hnodes = []
        vnodes = []
        h.each do | coords |
            hnodes.push( HCross.new( coords[ 0 ], coords[ 1 ]))
        end
        v.each do | coords |
            vnodes.push( VCross.new( coords[ 0 ], coords[ 1 ]))
        end
        vnodes.each do | vnode |
            j = vnode.start[ J ]
            i1 = vnode.start[ I ]
            i2 = vnode.finish[ I ]
            hnodes.each do | hnode |
                i = hnode.start[ I ]
                j1 = hnode.start[ J ]
                j2 = hnode.finish[ J ]
                if( j1 <= j && j <= j2 &&
                    i1 <= i && i <= i2 )
                    vnode.intasectn.push([ hnode, i - i1, j - j1 ])
                end
            end
        end
        [ hnodes, vnodes ]
    end
    ############################################################
    # put horizontal and vertical crossword coords into separate
    # arrays
    def getcross
        h = []
        v = []
        for i in ( 0 .. SIZ - 1 ) do
            j = 0
            while j < SIZ do
                if @crossword[ i ][ j ] == '-'
                    start = [ i, j ]
                    j += 1
                    while j < SIZ && @crossword[ i ][ j ] == '-' do
                        j += 1
                    end
                    j -= 1
                    finish = [ i, j ]
                    if start[ J ] < finish[ J ]
                        h.push([ start, finish ])
                    end
                end
                j += 1
            end
        end
        ########################################################
        # thats basically the same, but couldn't figure some non
        # ugly way how to factor it in a separate function
        for j in ( 0 .. SIZ - 1 ) do
            i = 0
            while i < SIZ do
                if @crossword[ i ][ j ] == '-'
                    start = [ i, j ]
                    i += 1
                    while i < SIZ && @crossword[ i ][ j ] == '-' do
                        i += 1
                    end
                    i -= 1
                    finish = [ i, j ]
                    if start[ I ] < finish[ I ]
                        v.push([ start, finish ])
                    end
                end
                i += 1
            end
        end
        [ h, v ]
    end
    def vertical_dfs( j )
        if j >= @v.length
            horizontal_dfs( 0 )
            return
        end
        node = @v[ j ]
        words = @d[ node.length ]
        n = words.length
        n.times do
            word = words.shift
            node.current_word = word
            node.apply_current_word
            vertical_dfs( j + 1 )
            words.push( word )
        end
    end
    def horizontal_dfs( j )
        raise "thumbs up" if j >= @h.length
        node = @h[ j ]
        words = @d[ node.length ]
        n = words.length
        n.times do
            word = words.shift
            node.current_word = word
            if node.match_current_word
                horizontal_dfs( j + 1 ) 
            end
            words.push( word )
        end
    end
    def vrooom
        begin
            vertical_dfs( 0 )
        rescue
            fill
        end
        @crossword
    end
    def fill
        @v.each do | node |
            j = node.start[ J ]
            i1 = node.start[ I ]
            i2 = node.finish[ I ]
            for i in ( i1 .. i2 ) do
                offset = i - i1
                @crossword[ i ][ j ] = node.current_word[ offset ]
            end
        end
        @h.each do | node |
            i = node.start[ I ]
            j1 = node.start[ J ]
            j2 = node.finish[ J ]
            for j in ( j1 .. j2 ) do
                offset = j - j1
                @crossword[ i ][ j ] = node.current_word[ offset ]
            end
        end
    end
    # construct dictionary mapping length -> [ w ]
    def consd( words )
        d = Array.new( SIZ + 1 ){ [] }
        words.split( ';' ).each do | w |
            d[ w.length ].push( w )
        end
        d
    end
end
################################################################
################################################################
crossword = Array.new(10)                 ######################
10.times do |i|                           ###################### 
    crossword_item = gets.chomp           ###################### 
    crossword[i] = crossword_item         ######################
end                                       ######################
words = gets.chomp                        ######################
result = crosswordPuzzle crossword, words ######################
puts result.join                          ######################
################################################################
################################################################
################################################################
################################################################
#                                                Congratulations
#                                      You solved this challenge
# Points:                                         1004.21 / 2200
# Rank:                                                   171849
# Thank U very much: www.youtube.com/watch?v=g3EAjzRnbL0&t=1905s
