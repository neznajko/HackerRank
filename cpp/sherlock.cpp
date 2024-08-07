////////////////////////////////////////////////////////////////
//##############################################################
//##############################################################
//##############################################################
//################################################### B  r  o  t　パン
///////////////////////////////////////////////////// M e n s ch　ひと　人
///////////////////////////////////////////////////// E - M a il　メール
/////////////////////////////////////////////////////
///////////////////////////////////////////////////// T e m p el　おてら　お寺
//###########\\\\/ |   \############################# P  a  r  k　こうえん　公園
//###########\\\\` @/\\\############################# Supermarkt　スーパー
//###########\\\\\\ \\\\############################# K a ufhaus　デパート
//###########\\\\-   \\\########################################
/////////////:::     :::////////////////////////////////////////
/////////////:::    /:::////////////////////////////////////////
/////////////%%| #  %%%%////////////////////////////////////////
/////////////%%\`   \%%%////////////////////////////////////////
//##############     ###########################################
//##############,   ############################################
//##############\   ############################################
//###############\  \###########################################
//////////////%%%%%  \%%%///////////////////////////////////////
//////////////||||||  ||||||||||||||||||||||||||||||||||||||||||
//////////////%%%%%%  %%%///////////////////////////////////////
//////////////%%%%%/  %%%///////////////////////////////////////
// www.hackerrank.com/challenges/sherlock-and-anagrams/problem
////////////////////////////////////////////////////////////////
# include <iostream>
# include <string>
# include <algorithm>
# include <vector>
////////////////////////////////////////////////////////////////
using namespace std;
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
string ltrim( const string&str){string s(str);s.erase(s.begin(),
find_if(s.begin(),s.end(),not1(ptr_fun<int,int>( isspace ) ) ));
return s;}//////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
string rtrim(const string &str){string s(str);s.erase(find_if(s.
rbegin(),s.rend(),not1(ptr_fun<int,int>(isspace))).base(),s.end(
));return s;}///////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
class Set {
private:
    vector <int> bufr = vector <int> ( 'z' + 1, 0 );
    int siz = 0;
public:
    bool has_key( char key ) const {
        return bufr[ key ];
    }
    void insert( char key ){
        ++bufr[ key ];
        ++siz;
    }
    void del( char key ){
        --bufr[ key ];
        --siz;
    }
    bool empty() const {
        return siz == 0;
    }
    friend
    ostream& operator <<( ostream& os, const Set& set );
};
////////////////////////////////////////////////////////////////
ostream& operator <<( ostream& os, const Set& set ){
    for( char key = 'a'; key <= 'z'; ++key ){
        if( set.has_key( key )){
            os << key << ": " << set.bufr[ key ] << endl;
        }
    }
    return os;
}
////////////////////////////////////////////////////////////////
// #############################################################
// #############################################################
// #############################################################
// #############################################################
int sherlockAndAnagrams( const string& s ){
    int n = s.length();
    int tot = 0;
    for( int i = n - 2; i >= 0; --i ){
        for( int j = i + 1; j < n; ++j ){
            Set U;
            Set V;
            for( int u = i, v = j; v < n; ++u, ++v ){
                char key = s[ u ];
                if( V.has_key( key )){
                    V.del( key );
                    if( U.empty() and V.empty()){
                        ++tot;
                    }
                } else {
                    U.insert( key );
                }
                key = s[ v ];
                if( U.has_key( key )){
                    U.del( key );
                    if( U.empty() and V.empty()){
                        ++tot;
                    }
                } else {
                    V.insert( key );
                }
            }
        }
    }
    return tot;
}
// #############################################################
// #############################################################
// #############################################################
////////////////////////////////////////////////////////////////
int main(){string q_temp;getline(cin,q_temp);int q=stoi( ltrim (
rtrim(q_temp)));for(int q_itr=0; q_itr < q; q_itr++ ){ string s;
getline(cin,s);int result= sherlockAndAnagrams(s);cout<<result<<
"\n";}}/////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
// Hackos:                                                  1210
// Max Score:                                              50.00
// Points:                                        1590.26 / 2200
// Rank:                                                   81297
