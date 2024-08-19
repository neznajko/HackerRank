################################################################
################################################################
################################################################
################################################################
class Plus
    attr_accessor :i, :j, :len
    def initialize( i, j, len )
        @i = i
        @j = j
        @len = len
    end
    def size( len = @len )
        4 * len + 1
    end
    def to_s
        "(#{i} #{j} #{len} #{size})"
    end
end
################################################################
################################################################
################################################################
################################################################
def cross( a, b )
    hrz_cross = -> ( d ) do #                 fish called lambda
        mid = a.len + b.len - d
        return a.size * b.size if mid <= 0 #            no cross
        periph = [ a.len - mid, b.len - mid ].max
        h = d / 2
        h = periph if periph > h
        return a.size( h ) * b.size( d - h )
    end
    vrt_cross = hrz_cross
    dx = ( a.j - b.j ).abs - 1
    dy = ( a.i - b.i ).abs - 1
    return hrz_cross.call( dx ) if a.i == b.i
    return vrt_cross.call( dy ) if a.j == b.j
    # put a to be the smaller( or equal )plus
    if a.len > b.len
        a, b = b, a
    end
    dmin = [ dx, dy ].min
    dmax = [ dx, dy ].max
    if dmin < a.len
        if dmax < a.len #                            two crosses
            u = a.size( dmax ) * b.size( dmax )
            v = a.size( dmin ) * b.size
            return [ u, v ].max
        end
        if dmax < b.len #                              one cross
            u = a.size * b.size( dmax )
            v = a.size( dmin ) * b.size
            return [ u, v ].max
        end
    end
    return a.size * b.size #                            no cross
end
################################################################
################################################################
class Grid
    def initialize( grid )
        @grid = grid
        @n = grid.length
        @m = grid[ 0 ].length
    end
    def getplus( i, j ) # @grid[i][j] == "G"
        len = 0
        while true do
            len += 1
            # North
            break if i - len < 0
            break if @grid[ i - len ][ j ] == "B"
            # East
            break if j + len >= @m
            break if @grid[ i ][ j + len ] == "B"
            # South
            break if i + len >= @n
            break if @grid[ i + len ][ j ] == "B"
            # West
            break if j - len < 0
            break if @grid[ i ][ j - len ] == "B"
        end
        return Plus.new( i, j, len - 1 )
    end
    def getpluses
        pluses = []
        @n.times do | i |
            @m.times do | j |
                if @grid[ i ][ j ] == "G"
                    pluses.push( getplus( i, j ))
                end
            end
        end
        pluses
    end
    def get_maxproduct
        plus = getpluses
        nplus = plus.length
        maxproduct = 0
        for i in ( 0 .. nplus - 2 ) do
            a = plus[ i ]
            for j in ( i + 1 .. nplus - 1 ) do
                 b = plus[ j ]
                 product = cross( a, b )
                 if product > maxproduct
                     maxproduct = product
                 end
            end
        end
        maxproduct
    end
end
################################################################
################################################################
################################################################
################################################################
################################################################
def twoPluses( grid )
    Grid.new( grid ).get_maxproduct
end
################################################################
################################################################
################################################################
################################################################
first_multiple_input=gets.rstrip.split #########################
n=first_multiple_input[0].to_i #################################
m=first_multiple_input[1].to_i #################################
grid=Array.new(n) ##############################################
n.times do |i| #################################################
    grid_item=gets.chomp #######################################
    grid[i]=grid_item ##########################################
end ############################################################
result=twoPluses grid ##########################################
p result #######################################################
################################################################
################################################################
################################################################
################################################################
# Hackos:                                                   1609
# Max Score:                                               40.00
# Points:                                         2118.21 / 2200
# Rank:                                                    51442
