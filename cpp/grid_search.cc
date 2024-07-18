////////////////////////////////////////////////////////////////
// www.hackerrank.com/challenges/the-grid-search/problem
////////////////////////////////////////////////////////////////
# include <iostream>
# include <vector>
# include <string>
# include <algorithm>
////////////////////////////////////////////////////////////////
using namespace std;
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
// メアリー：ただいま。
// Mary: Ich bin zurück.
// お父さん：おかえりなさい。映画はどうでしたか。
// Vater: Willkommen zurück. Wie war der Film?
// メアリー：見ませんでした。たけしさんは来ませんでした。
// Mary: Ich habe es nicht gesehen. Takeshi ist nicht gekommen.
// お父さん：えつ、どうしてですか。
// Vater: Hä, warum?
// メアリー：わかりません。だから、一人で本屋とお寺に行きました。
// Mary: Ich verstehe es nicht. Deshalb bin ich allein zur
//       Buchhandlung und zum Tempel gegangen.
// お父さん：人がたくさんいました。
// Vater: Es waren viele Leute da.
// メアリー：はい。お寺で写真をたくさん撮りました。
// デパートのも行きました。
// はい、おみやげです。
// Mary: Ja. Ich habe viele Fotos im Tempel gemacht.
// Ich bin auch ins Kaufhaus gegangen.
// Ja, es ist ein Souvenir.
// お父さん：ありがとう。
// Vater: Danke.
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
string ltrim(  const string & str ){ string  s( str );  s.erase(
s.begin(), find_if( s.begin(), s.end(), not1( ptr_fun <int, int>
( isspace )))); return s;}//////////////////////////////////////
////////////////////////////////////////////////////////////////
string rtrim(  const string & str ){  string s(  str ); s.erase(
find_if( s.rbegin(), s.rend(), not1( ptr_fun <int, int> (isspace
))).base(), s.end()); return s;}////////////////////////////////
////////////////////////////////////////////////////////////////
vector <string> split(  const  string  & str ){  vector <string> 
tokens; string::size_type start = 0; string::size_type end  = 0;
while(( end = str.find( " ", start )) != string::npos ){ tokens.
push_back( str.substr( start, end - start )); start = end + 1; }
tokens.push_back( str.substr( start )); return tokens;}/////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
string gridSearch( const vector <string> & grid,
                   const vector <string> & pat )
{
    int n_grid = grid.size();
    int  n_pat =  pat.size();
    int m_grid = grid[ 0 ].size();
    int  m_pat =  pat[ 0 ].size();
    
    int n = n_grid - n_pat + 1;
    int m = m_grid - m_pat + 1;
    for( int i = 0; i < n; ++i ){
        for( int j = 0; j < m; ++j ){
            for( int u = 0; u < n_pat; ++u ){
                for( int v = 0; v < m_pat; ++v ){
                    if( grid[ i + u ][ j + v ] !=
                        pat[ u ][ v ] ){
                        goto nope;
                    }
                }
            }
            return "YES";
        nope:;
        }
    }
    return "NO";
}
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
int main(){ string t_temp; getline( cin, t_temp ); int t = stoi(
ltrim( rtrim( t_temp ))); for( int t_itr = 0; t_itr < t; t_itr++
){     string first_multiple_input_temp;     getline   (    cin, 
first_multiple_input_temp     )      ;      vector      <string> 
first_multiple_input = split( rtrim( first_multiple_input_temp )
); int R = stoi( first_multiple_input[   0   ]); int C  =  stoi(
first_multiple_input[ 1 ]); vector <string> G( R ); for( int i =
0; i < R; i++ ){ string G_item; getline( cin, G_item ); G[ i ] =
G_item;  } string second_multiple_input_temp ; getline(   cin  , 
second_multiple_input_temp     )      ;       vector <  string > 
second_multiple_input = split( rtrim( second_multiple_input_temp
)); int r = stoi( second_multiple_input[  0 ]);  int c  = stoi (
second_multiple_input[ 1 ]); vector <string> P(  r ); for( int i 
= 0; i < r; i++ ){ string P_item; getline( cin, P_item ); P[ i ]
= P_item;} string result = gridSearch( G, P ); cout << result <<
"\n";}}/////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
// Hackos:                                                  1099
// Max Score:                                              30.00
// Points:                                        1304.21 / 2200
// Rank:                                                  112777
