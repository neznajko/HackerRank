////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
using System;
using System.Collections.Generic;
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
// 0 9 _ _ _ _ _ _ _ _ _ _ _ Guard
// 1 8 _ - - - - - - - - _ - empty square
// 2 7 _ - - - - - - - - _ 
// 3 6 _ - - - - - - - - _
// 4 5 _ - - - - - - - - _
// 5 4 _ - - - - - - - - _
// 6 3 _ - - - - - - - - _
// 7 2 _ - - - - - - - - _
// 8 1 _ - - - - - - - - _
// 9 0 _ _ _ _ _ _ _ _ _ _ 
//     0 1 2 3 4 5 6 7 8 9
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
// NW, N, NE,
//  W,     E,
// SW, S, SE,
public enum Compass : long { NW, N, NE, E, SE, S, SW, W, }
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
class Board {
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
    private long board_size;
    private HashSet <long> board;
    private long[] step;
    private long RankToOff( long rank )
    {
        return board_size - rank - 1;
    }
    private long GetOff( long rank, long file )
    {
        return RankToOff( rank ) * board_size + file;
    }
    private void ConsBoard( long board_size )
    {
        this.board_size = board_size;
        board = new HashSet <long> ();
        step = new long[]{ 
            -board_size -1,  // NW 
            -board_size,     // N
            -board_size + 1, // NE
             1,              // E
             board_size + 1, // SE
             board_size,     // S
             board_size - 1, // SW
            -1               // W
        };
        long b = board_size - 1;
        long top_left = GetOff( b, 0 );
        long top_ryte = GetOff( b, b );
        long bot_ryte = GetOff( 0, b );
        long bot_left = GetOff( 0, 0 );
        //               N         E         S         W
////////////////////////////////////////////////////////////////
        long[] conrs = { bot_left, top_left, top_ryte, bot_ryte };
        long j = ( long ) Compass.N;
        foreach( long off in conrs ){
            long i = off;
            for( long k = 0; k < b; ++k ){
                board.Add( i );
                i += step[ j ];
            }
            j += 2;
        }
    }
////////////////////////////////////////////////////////////////
// (a) 毎日 jeden Tag
// (b) よく oft 
// (d) あまり nicht viel
// (c) 時々 manchmal
////////////////////////////////////////////////////////////////
// (1) a, 日本語を勉強します lerne Japanisch
// (2) b, 図書館に行きます gehe zur Bibliothek
// (3) b, アメリカの映画を見ます Sehe amerikanische Filme
// (4) d, 日本語の映画を見ます Sehe japanische Filme
// (5) c, テニスをします Spiele Tennis
// (6) c, コーヒーを飲みます Trinke Kaffee
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
    public void Print()
    {
        foreach( var off in board ){
            Console.WriteLine( off );
        }
    }
    public Board( long n )
    {
        ConsBoard( n + 2 ); // add guards
    }
    public void InsertCoin( long rank, long file )
    {
        board.Add( GetOff( rank, file ));
    }
    public long GetQueenMoves( long rank, long file )
    {
        long nmoves = 0;
        long queen_pos = GetOff( rank, file );
        // c#'s enum s. u. c. k. s!
        foreach( var dr in Enum.GetValues( typeof( Compass ))){
            long inc = step[( long )dr ];
            long r = queen_pos;
            while( true ){
                r += inc;
                if( board.Contains( r )) break;
                ++nmoves;
            }
        }
        return nmoves;
    }
}
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
class Result {
    public static int queensAttack( int n, int k, int r, int f, 
            List <List <int>> obstacles )
    {
        Board board = new Board( n );
        foreach( var obstacle in obstacles ){
            int rank = obstacle[ 0 ];
            int file = obstacle[ 1 ];
            board.InsertCoin( rank, file );
        }
        return ( int )board.GetQueenMoves( r, f );
    }
}
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
class  Solution {  public static void Main ( string []  args ) {
string  [ ]  firstMultipleInput  =  Console.ReadLine().TrimEnd()
.Split(' '); int n  =  Convert.ToInt32(firstMultipleInput[ 0 ]);
int k  =  Convert.ToInt32(  firstMultipleInput[  1  ]); string[] 
secondMultipleInput  =  Console.ReadLine().TrimEnd().Split(' ');
int r_q  =  Convert.ToInt32(secondMultipleInput[  0  ]); int c_q 
= Convert.ToInt32( secondMultipleInput[ 1 ]); List <List <int> > 
obstacles = new List<List<int>>(); for (int i = 0; i < k; i++) {
obstacles.Add( Console.ReadLine().TrimEnd().Split( ' ').ToList()
.Select(obstaclesTemp => Convert.ToInt32( obstaclesTemp)).ToList
(  )  )  ;  } int result = Result.queensAttack ( n, k, r_q, c_q, 
obstacles );Console.WriteLine( result ) ; } }///////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
// This is not a problem for wise thoughts, but OK            ..
// In a society where everybody are winners, the society is the
// loser, by the way more then two months without watching tv
// and reading news, and I feel great                         :)
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
// Points:                                        1204.21 / 2200
// Rank:                                                  128028

