////////////////////////////////////////////////////////////////
//   ,`,`,`,`             `,`,`,`               `,`,`,`,`,`,`,//
// ,`,`,`,`        ,        `,`        ,`,        `,`,`,`,`,`,//
//`,`,`,`        .` `,               ,`   `,                  //
//`,`,`        .`    ,`            ,`    ,`                   //
//`,`        .`     ` ` ` ` ` `,`,`     ` ` ` ` ` `,`        ,//
//`        .`    , ,     , , ,`.`    , , ,     , ,`        ,`,//
//       ,`    ,`   `,    `,  `,   ,`  ,`    ,`          ,`,`,//
//        `, ,`       `, ,`     `,`     `, ,`          ,`,`,`,//
//`,        `           `                 `          ,`,`,`,` //
//`,`,               @@                @ @       ,`,`,`,`,`   //
//`,`,`,         ,`@   @     ,       ,@   @    ,`,`,`,`,`     //
//`,`,`,`,     ,`@`,`, @   ,`,`,   ,`,@,  @  ,`,`,`,`,`       //
//  `,`,`,`, ,`@`,`,`@`, ,`,@,@,@,@,@,@,`,@,@,@,@,` `        ,//
//    `,`,`,`@`,`,`@`,`,`,`@`,`,`,`,`,`,`,`,`,`,`@         ,`,//
//      `,`@`,`,`  @`,`,`,`@` `,`,`,` `,`,`,`,`  @       ,`,`,//
//       @`,`,`@   @  `,`,` @ @ @,@ @ @ `,@,@ @ @      ,`,`,`,//
//`,     @  `@ @   @    `             @   @        , ,`,`,`,`,//
//`,`,    @@   @   @        @@        @   @      ,`,`,`,`,`,`,//
//`,`,`,       @ ,`@       @ , @     ,@   @    ,`,`,`,`,`,`,`,//
//`,`,`,`,     @`,`@`,     @`,`, @ ,`,@,  @  ,`,`,`,`,`,`,`,`,//
//`,`,`,`,`, ,`@`,`@`,`, ,`,`@`.`@`,`,@,`,@.`,`,`,`,`,`,`,`,`,//
//`,`,`,`,`,`,`@`,`@`,`,`,`,`,`@@.`,`,@,`,@,`,`,`,`,`,`,`,`,`,//
//`,`,`,`,`,`,`@`,`@`,`,`,`,`,`,`.`,`,@,`,@,`,`,`,`,`,`,`,`,`,//
//`,`,`,`,`,`,`,@,@,`,`,`,`,`,`,`.`,`,`@`@`,`,`,`,`,`,`,`,`,`,//
//`,`,`,`,`,`,`,`,`,`,`,`,`,`,`,`.`,`,`,`,`,`,`,`,`,`,`,`,`,`,//
////////////////////////////////////////////////////////////////
// 彼 の 目 に は 魂 の「符」が 見 え た 。
// В погледа му си личаха [ белезите ] на душата му.         
////////////////////////////////////////////////////////////////
# include <iostream>
# include <string>
# include <vector>
# include <algorithm>
////////////////////////////////////////////////////////////////
using namespace std;
////////////////////////////////////////////////////////////////
// hackerrank.com/challenges/string-function-calculation/
////////////////////////////////////////////////////////////////
// 1 ≤ |t| ≤ 10⁵
// t[j] ∈ { a .. z }
////////////////////////////////////////////////////////////////
ostream& operator<<( ostream& os, const vector<int>& vec ){
    for( auto el: vec ){
        os << el << " ";
    }
    return os;
}
////////////////////////////////////////////////////////////////
constexpr int ALPHACOUNT = 'z' + 1;
constexpr int MAXLEN = ( int ) 1e5;
constexpr int MAXSTATES = MAXLEN * 2;
////////////////////////////////////////////////////////////////
struct State {
    int len = 0;
    int prev = -1;
    vector <int> next;
    State():
        next( ALPHACOUNT ){
    }
    int cntr = 1;
};
////////////////////////////////////////////////////////////////
// おもしるい  面白い  interesting; funny
// 面白い映画 interesting movie
// きのう、面白い映画を見ました。I saw an interesting movie yesterday
// こわい先生 a scary teacher
// 山下先生はこわい先生です。Professor Yamashita is a scary teacher
////////////////////////////////////////////////////////////////
struct SuffixAutomaton {
    const string& t;
    int sp = 0; // stack pointer
    int last = 0;
    vector <State> st;
    //
    SuffixAutomaton( const string& t ):
        t( t ),
        st( MAXSTATES ){
    }
    int new_state() {
        return ++sp;
    }
    int extend( char c ){
        // (1)
        int cur = new_state();
        st[ cur ].len = st[ last ].len + 1;
        // (2)
        int p = last;
        while(! st[ p ].next[ c ]){
            st[ p ].next[ c ] = cur;
            // (3)
            if(( p = st[ p ].prev ) == -1 ){
                st[ cur ].prev = 0;
                return cur;
            }
        }
        // (4)
        int q = st[ p ].next[ c ];
        // (5)
        if( st[ p ].len + 1 == st[ q ].len ){
            st[ cur ].prev = q;
            return cur;
        }
        // (6)
        int clone = new_state();
        st[ clone ] = st[ q ];
        st[ clone ].len = st[ p ].len + 1;
        st[ clone ].cntr = 0;
        st[ cur ].prev = st[ q ].prev = clone;
        while( st[ p ].next[ c ] == q ){
            st[ p ].next[ c ] = clone;
            if(( p = st[ p ].prev ) == -1 ){
                break;
            }
        }
        return cur;
    }
    void build() {
        for( char c: t ){
            last = extend( c );
        }
    }
    vector <int> sort() {
        vector <vector <int>> buckets( t.size() + 1 );
        for( int v = 1; v <= sp; ++v ){
            buckets[ st[ v ].len ].push_back( v );
        }
        vector <int> sorted;
        for( int len = t.size(); len > 0; --len ){
            sorted.insert( sorted.end(),
                           buckets[ len ].begin(),
                           buckets[ len ].end());
        }
        return sorted;
    }
    void count() {
        for( int v: sort()){
            st[ st[ v ].prev ].cntr += st[ v ].cntr;
        }
    }
    int almost_there() {
        int maxvalue = -1;
        count();
        for( int v = 1; v <= sp; ++v ){
            maxvalue = max( maxvalue, st[ v ].len * st[ v ].cntr );
        }
        return maxvalue;
    }
};
////////////////////////////////////////////////////////////////
int maxValue( const string& t ){
    auto a = SuffixAutomaton( t );
    a.build();
    return a.almost_there();
}
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
// #############################################################
// ## This i s a nice problem from one old Bulgarian book I have 
// ## but i s not here r i g h t now cos I thought that wouldn't     
// ## solve this problem for quite a while, so basically we have 
// ## three vectors a b c originating from common origin O which
// ## are not lying in s a m e plane. On a sheet of paper we are 
// ## given the angles, something like:
// ##                ###########################################
// ## ###\######/### ##, and so on, and we have to build using #
// ## ####\####/#### ### ruler and compass the angle between a #
// ##   a  \  /  b   # vector and the bc plane. Thats ##########
// ## ######\/###### ###########################################
// ## ############## ### Zo in 3D we make a sphere with some ###
// ##                ### radius this will cross the vectots a, b 
// ##################### and c in points A, B, C respectively ##
// ## In 2D we can pick some length and put it on the angles, ##
// ### this will give us all distances AB, AC, BC, OA, OB and OC 
// ## In 3D if we look at the plane bc in top projection we will
// ## see something like this:##################################
// ##############################                            ###
// ## I forgot to mention that ## / is the plane             ###
// ## it is guaranteed that the # perpendicular to bc, and A ###
// # angles are sharp. So the ### lies on it above bc        ###
// ## projection of A onto bc ###           O                ###
// # say is A`. From triangle ###          .`.               ###
// ## OAB we drop a perpendicular    b   .`/  `.  c          ###
// ## from A to OB say it crosses      .` / A   `.           ###
// ### at M, same with AOC -> N #    .`  /        `.         ###
// ## Now we have the OM and ON #  B` ` ` ` ` ` ` ` `C       ###
// #### lengths, from the #######                            ###
// # triangle OBC in 2D we put them and drop perpendiculars ####
// ### from M and N, they will cross at A`, now we connect OA` #
// ##### it will cross BC at say Q, now we have OA, OQ and BQ ##
// ### from triangle ABC we can find AQ, so using the compass we
// ## can build the triangle OAQ, the angle between a and bc, ##
// #### is ∠(AOQ)                                              «
// #############################################################
// #############################################################
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
int main() {
    string t;
    cin >> t;
    cout << maxValue( t ) << endl;
}
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
// Challenges:                                         161 / 563 
// Rank:                                                    6609
// Points:                                                  4583
// Hackos:                                                  2359
// Score:                                                     80
