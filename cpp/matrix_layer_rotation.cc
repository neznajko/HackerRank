////////////////////////////////////////////////////////////////
//www.hackerrank.com/challenges/matrix-rotation-algo/problem
////////////////////////////////////////////////////////////////
# include <iostream>
# include <vector>
# include <string>
# include <algorithm>
# include <iomanip>
////////////////////////////////////////////////////////////////
using namespace std;
////////////////////////////////////////////////////////////////
string ltrim( const string&str){string s(str);s.erase(s.begin(),
find_if( s.begin(), s.end(), not1( ptr_fun<int,int>(isspace))));
return s;}//////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
string rtrim(const string & str){string s(str);s.erase(find_if(s
.rbegin(),s.rend(),not1(ptr_fun<int,int>(isspace))).base(),s.end
());return s;}//////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
vector <string> split( const string &str ){vector<string>tokens;
string::size_type start=0;string::size_type end=0;while((end=str
.find(" ", start ))!= string::npos){tokens.push_back(str.substr(
start,end-start )); start=end+1; }tokens.push_back( str.substr (
start));return tokens;}/////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
void print_mat( const vector <vector <int>> & mat, int w = 0 ){
    for( const auto& r: mat ){
        int n = r.size();
        for( int j = 0; j < n; ++j ){
            if( w > 0 ){
                cout << setw( w );
            } else {
                if( j > 0 ){
                    cout << " ";
                }
            }
            cout << r[ j ];
        }
        cout << endl;
    }
}
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
struct Coord {
    int i;
    int j;
};
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
// メアリー：おっ、たけしさん。きのう来ませんでしたね。
// タケシ：行きましたよ。モスバーガーの前で一時間待ちました。
// メアリー：モスバーガーじゃないですよ。マクドナルドですよ。
// タケシ：マクドナルド......　ごめんなさい。
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
// Mary: Oh, Takeshi-san. Du bist gestern nicht gekommen.
// Takeshi: Doch, ich bin gekommen. Ich habe eine Stunde vor Mos
//          Burger gewartet.
// Mary: Nicht Mos Burger. McDonald's.
// Takeshi: McDonald's... Entschuldigung.
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
ostream& operator <<( ostream& os, Coord c ){
    return os << c.i << ", " << c.j;
}
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
class Layer {
public:
    int top;
    int bot;
    int left;
    int ryte;
    int size;
    Layer( int top, int bot, int left, int ryte )
    : top(  top  ),
      bot(  bot  ),
      left( left ),
      ryte( ryte )
    {
        size = 2 * ( bot - top + ryte - left );
    }
    Coord next( Coord curr ) // ccw
    {
        int i = curr.i;
        int j = curr.j;
        if( i == top && j > left ){
            --j;
        } else if( i == bot && j < ryte ){
            ++j;
        } else if( j == left && i < bot ){
            ++i;
        } else {
            --i;
        }
        return { i, j };
    }
    Coord nth_next( Coord curr, int n )
    {
        n %= size;
        for(; n > 0; --n ){
            curr = next( curr );
        }
        return curr;
    }
    Coord prev( Coord curr ) // cw
    {
        int i = curr.i;
        int j = curr.j;
        if( i == top && j < ryte ){
            ++j;
        } else if( i == bot && j > left ){
            --j;
        } else if( j == left && i > top ){
            --i;
        } else {
            ++i;
        }
        return { i, j };
    }
    void ccw( int n,
              const vector <vector <int>> & orig,
              vector <vector <int>> & copy )
    {
        Coord src{ top, left };
        Coord dst = nth_next( src, n );
        for( int j = 0; j < size; ++j ){
            copy[ dst.i ][ dst.j ] = orig[ src.i ][ src.j ];
            src = prev( src );
            dst = prev( dst );
        }
    }
};
////////////////////////////////////////////////////////////////
ostream& operator<<( ostream& os, const Layer& layer ){
    os << "top/bot:   " << layer.top << "/" << layer.bot << endl
       << "left/ryte: " << layer.left << "/" << layer.ryte << endl
       << "size: " << layer.size << endl;
    return os;
}
////////////////////////////////////////////////////////////////
void matrixRotation( const vector <vector <int>> & mat, int n ){
    int top = 0;
    int bot = mat.size() - 1;
    int left = 0;
    int ryte = mat[ 0 ].size() - 1;
    vector <Layer> layers;
    while( top < bot and left < ryte ){
        layers.emplace_back( top, bot, left, ryte );
        ++top;
        --bot;
        ++left;
        --ryte;
    }
    const auto& orig = mat;
    auto copy = mat;
    for( auto& layer: layers ){
        layer.ccw( n, orig, copy );
    }
    print_mat( copy );
}
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
int main( ) { string first_multiple_input_temp ; getline ( cin ,
first_multiple_input_temp);vector<string> first_multiple_input=
split  (  rtrim  (  first_multiple_input_temp  ) ) ;int m =stoi(
first_multiple_input[0]);int n=stoi(first_multiple_input[1]);int
r=stoi(first_multiple_input[ 2 ]);vector<vector<int>> matrix(m);
for ( int i = 0; i < m ; i++ ) {matrix [ i ].resize ( n );string
matrix_row_temp_temp; getline( cin, matrix_row_temp_temp);vector
<string> matrix_row_temp=split( rtrim(matrix_row_temp_temp));for
(int j=0;j<n;j++){ int matrix_row_item=stoi(matrix_row_temp[j]);
matrix[ i ][ j ] = matrix_row_item;}}matrixRotation(matrix, r);}
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
// Hackos:                                                  1134
// Max Score:                                                 80
// Points:                                        1424.21 / 2200
// Rank:                                                   97604
