//                        /////////////////////////////////////
// ###################### /////////////////////////////////////
// ###################### /////////////////////////////////////
// ###################### /////////////////////////////////////
// ###################### /////////////////////////////////////
// #########     ######## /@@@@@@@||||. . .||||@@@@@@@@@@@@@@@@
// #####    ` ` `         /@@@@@@@||||.   .||||@@@@@@@@@@@@@@@@
// #####    `   ` Q = nd⁴ /|. . . . . .   . . . . . .||||@@@@@@
// #####    `   `         /|.                       .||||@@@@@@
// ## ` ` ` `   ` ` ` `   /|. . . . . . . . . . . . .||||@@@@@@
// ## `               `   /||||.  .||||@@@||||.  .||||@@@@@@@@@
// ## ` ` ` `   ` ` ` `   /|||.     .|||||||.     .||||@@@@@@@@
// #####   `     `        /||.     .||||@||||.     .||||@@@@@@@
// #####= `       ` ===== /|.     .||.|||||.||.     .||||@@@@@@
// ##### `         ` #### /|||.  .||.  .|.  .||.  .||||@@@@@@@@
// #### `   `   `   ` ### /@||||.||.         .||.||||@@@@@@@@@@
//     `   ``   ``   `    /@@@@@@||||.     .||||@@@@@@@@@@@@@@@
//    `   ` `   ` ` ` `   /@@@@||||.         .||||@@@@@@@@@@@@@
//   `   `  `   `         /@@||||.     .|.     .||||@@@@@@@@@@@
//  ` ` `   `   `         /||||.     .|||||.     .||||@@@@@@@@@
// ________ `   ` _______ /||.     .||||@||||.     .||||@@@@@@@
// ________ `   ` _______ /|||.  .||||@@@@@||||.  .||||@@@@@@@@
// ________ ` ` ` _______ /||||.||||@@@@@@@@@||||.||||@@@@@@@@@
// ______________________ /////////////////////////////////////
// ______________________ /////////////////////////////////////
// ______________________ /////////////////////////////////////
//                        /////////////////////////////////////
//                        /////////////////////////////////////
//                        /////////////////////////////////////
//                        /////////////////////////////////////
// 学「校」の 鐘 が 鳴 る。[ Училищният ] звънец бие
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
// hackerrank.com/challenges/maximum-subarray-sum/
////////////////////////////////////////////////////////////////
# include <iostream>
# include <vector>
# include <set>
# include <algorithm>
using namespace std;
////////////////////////////////////////////////////////////////
typedef long u64;
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
// We are given an array o f integers V and a number M, and have
// to find a continuous subarray of V such that t h e sum of its
// elements modulo M is the maximum possible.
//
// Whenever we are dealing with sum of sub a r r a y s the first
// t h i n g to consider is using the so called prefix sum array,
// which is similar to t h e Cumulative Distribution Function in
// Probability T h e o r y, t h a t is the prefix sum array P of
// V[1], ... ,V[N] i s defined as P[J] = V[1] + ... + V[J] f o r
// 0 <= J <= N, having this we c a n easily find the sum of some
// sub array between I and J a s P[J] - P[I - 1]. Here b e c o z
// we a r e dealing with modular arithmetic the prefix sum array
// will b e non monotonically increasing, for its calculation we
// can use the formula:
// (a + b) mod m = (a mod m + b mod m) mod m,
// this can be proved using the Division Theorem:
// a = floor( a / m ) * m + ( a mod m )
// Be coz all values of P are in the range [ 0, m ), the maximum
// sum for all sub a r r a y s V[ I:J ] s u c h that I < J a n d
// P[I] < P[J] will be s i m p l y equal to P[J] that is the sub
// array V[ 0:J ] the interesting sub arrays are those for which
// P[I] > P[J], and I < J f o r example let M = 7, P[3] = 0, and
// P[1] = 1, t h e n P[3] - P[1] = -1, and -1 mod 7 = 6 which is
// the maximum p o s s i b l e value we can have. So to maintain
// O( NLOGN ) time complexity we have to keep all seen values of
// P up to J in a sorted array and use binary search for finding
// the first value F bigger t h e n the current P[J]. Then t h e
// corresponding sum will be M - F + P[J]. In theory we have t o
// use a binary search tree implementation t o keep those values
// in a set, the problem is t h a t hR has very nasty test cases
// which might result in a linear time search, so we have to use
// balanced search trees like Red Black Trees. I've d o n e once
// such implementation before and I'm not doing it a g a i n : ),
// fortunately C + + has t h e set structure based o n Red Black
// Trees with sorted keys and an upper_bound method that returns
// the first value grater then a given key
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
u64 maximumSum( vector <u64> &v, u64 m ){
    v[0] %= m;
    u64 subsum = v[0];
    set <u64> s{ subsum };
    for( size_t j = 1; j < v.size(); ++j ){
        
        if( subsum == m - 1 ) break;

        v[j] %= m;
        v[j] += v[j - 1];
        v[j] %= m;
        
        subsum = max( subsum, v[j] );
        
        auto it = s.upper_bound( v[j] );
        if( it != s.end()){
            subsum = max( subsum, m - *it + v[j] );
        }
        s.insert( v[j] );
    }
    return subsum;
}
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
int main() {
    // q - number of queries( int )
    // n m - vector size( int ), modulo( u64 )
    // v1 v2 ... vn - vector elements( u64 )
    int q, n;
    u64 m;
    vector <u64> v;
    cin >> q;
    cin >> n >> m;
    for( ; n > 0; --n ){
        u64 e;
        cin >> e;
        v.push_back( e );
    }
    cout << maximumSum( v, m ) << endl;
}
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
// Hackos:                                                  2211
// Max Score:                                                 65
// Challenges:                                         148 / 563 
// Rank:                                                    9058
// Points:                                                  4037
// Yea: I've watched some futuristic view where rich people live
// at some platforms in the sky, whereas cities are full of poor
// people. Becoz of our survival I g u e s s we look like robots
// programmed to maximize their freedom. This w i l l for taking
// h i g h e r grounds c r e a t e s naturally the hierarchy and
// restrictions we observe in our physical l i f e, But there is
// no guards to restrict y o u r hunger for freedom o n a mental
// level. And I guess most o f the m e n t a l problems like bad
// thoughts o r non stop criticism and judgment of the others is
// d u e to this unbound will for mental superiority, becoz as a
// rule when a t higher positions we start waving axes and whips.
// So the solution is n o t to meditate but to f i n d means t o
// restrict your will of h a v i n g mental superiority over the
// others. We a r e most effective when neither overestimate nor
// underestimate ourselves but when we l i v e in a s t a t e of
// balance. By the way be cos recently they have chosen new Pope
// I was wondering isn't this t h e reason why people believe in
// things that are obviously dubious to say at l e a s t, be coz
// having intimate connection w i t h the Almighty feeds y o u r
// hunger of mental s u p e r i o r i t y with unlimited freedom
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
