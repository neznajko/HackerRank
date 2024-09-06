////////////////////////////////////////////////////////////////
// hackerrank.com/challenges/acm-icpc-team/
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
# include <iostream>
# include <vector>
# include <string>
# include <algorithm>
////////////////////////////////////////////////////////////////
using namespace std;
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
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
int nft( const string& a, const string& b ){ // number of topics
    int n = 0;
    for( int j = a.size() - 1; j >= 0; --j ){
        if( a[ j ] == '1' or b[ j ] == '1' ){
            ++n;
        }
    }
    return n;
}
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
vector <int> acmTeam( const vector <string> & topic ){
    int n = topic.size();
    int m = 0; // maximum number of topics
    int t = 0; // number of teams having m
    for( int i = 0; i < n; ++i ){
        const string& a = topic[ i ];
        for( int j = i + 1; j < n; ++j ){
            const string& b = topic[ j ];
            int c = nft( a, b ); // current number of topics
            if( c > m ){ 
                m = c;
                t = 1;
            } else if( c == m ){
                ++t;
            }
        }
    }
    return { m, t };
}
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
int main(        ){string first_multiple_input_temp;getline(cin,
first_multiple_input_temp );vector< string >first_multiple_input
=  split(  rtrim( first_multiple_input_temp ));int n  =  stoi  (
first_multiple_input[ 0 ]);int m=stoi(first_multiple_input[1]) ;
vector<string>topic(n);for(int i = 0;i<n;i++){string topic_item;
getline(cin,topic_item);topic[i]=topic_item; }vector<int>result= 
acmTeam(topic);for(size_t i=0;i<result.size(); i++){cout<<result
[i];if(i!=result.size()-1) { cout << endl ; } } cout << endl ; }
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
// Hackos:                                                  1724
// Max Score:                                                 25
// Challenges:                                          88 / 563
// Points:                                                  2363
// Rank:                                                   36266
// Oh:    no a detector collapse, collapse, collapse! I was just
//    thinking that this might be interesting if we have a three
//   slit experiment with a detector on the first slit, would we
//      see an interference picture, I think yes because in case 
// where the detector didn't register a particle we would have a
//   scenario like a double slit experiment with no detector, so
//   if we can calculate the probability of an electron to be at
//  some position on the screen in a double slit experiment with
//      no detector then we can calculate the probability of the
//     electron to be let's say exactly behind the first slit in
//             case of a three slits experiment with a detector:
//                                                             _
// ___________________________________________________________ _
//              X                                       screen _
//                                                             _
//                                                             _
//                                                             _
//                                                             _
//                                                             _
//                                                             _
//            D                                                _
// _____________ _______ _______ _____________________________ _
//                                                             _
//              A       B       C                              _
//                                                             _
//                                                             
//  If D is the event that the detector has fired and D* is that
//         it has not fired, and P( X ) is the probability of an
//                            electron being at position X then:
//         P( X ) = P( D )P( X | D ) + P( D* )P( X | D* ), where
//  P( D ) = 1/3, P( D* ) = 2/3, P( X | D ) = 1, and P( X | D* )
//       will be the probability as given by the solution of the
//       Schrodinger equation for double slit experiment without
//                                                      detector
