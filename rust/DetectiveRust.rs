////////////////////////////////////////////////////////////////
use std::collections::{ VecDeque, HashSet };
////////////////////////////////////////////////////////////////
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ |
//@@@@@@@@@@@@@@@@@@@@@@@@@@@ 1 @@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
//@@@@@@@@@@@@@ 2 @@@@@@@@@@@        @@@@@@@@@@@@@@@@@@@@@@@@@@@
//@@@@@@@@@@@@                                      @@@@@@@@@@@@ :
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ :
//@@@@@@@@@@@@@@@@                              @@@@@@@@@@@@@@@@
//@@@@@@@@@@@@@@@@        @@@@@@@@@@@@@@        @@@@@@@@@@@@@@@@
//@@@@@@@@@@@@@@@@                               3 @@@@@@@@@@@@@ |
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@ |
//@@@@@@@@@@@@                                      @@@@@@@@@@@@ |
//;;;;;;;;;;;;        ;;;;; 5 ;;;;;;;;;;;;;;        ;;;;;;;;;;;; ;
//;;;;;;;;; 4         ;;                  ;;        ;;;;;;;;;;;; ;
//@@@@@@@@@@@@        @@        @@        @@         6 @@@@@@@@@
//@@@@@@@@@@@@        @@                  @@        @@@@@@@@@@@@
//@@@@@@@@@@@@        @@@@@@@@@@@@@@@@@@@@@@        @@@@@@@@@@@@
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@        @@@@@@@@@@@@
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
//@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@
////////////////////////////////////////////////////////////////
// 彼女の「高」価な微笑みの裏には、孤独な心が鼓動していた。
// Зад [скъпата] ѝ усмивка туптеше самотното ѝ сърце.
////////////////////////////////////////////////////////////////
use std::io;
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
// 23. [M25] Give a geometric p r o o f that ln xy = ln x + ln y,
// based on Fig. 6.
//
// Fig. 6 gives the f u n c t i o n 1/x and states that the area
// between 1 and x is ln x; looks like t h e word geometric here
// is used to deceive t h e poor reader looking for hints. So we
// can write:
//         ₓᵧ       ₓ       ₓᵧ
// ln xy = ∫dt/t = ∫dt/t + ∫dt/t; the first integral is ln x
//         ¹       ¹        ˣ 
// i n the s e c o n d we make the substitution t/x = u, and the
// integral becomes equal to:
//  ᵧ
// ∫dt/t = ln y
// ¹                                                           «
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
fn read_line() -> String {
    let mut s = String::new();
    io::stdin()
        .read_line( &mut s )
        .expect( "ha_ha" );
    return s;
}
////////////////////////////////////////////////////////////////
fn parse_line() -> Vec <i32> {
    return read_line()
        .trim()
        .split_whitespace()
        .map( |x| x.parse::<i32>().expect( "s_u_c_k_s" ))
        .collect();
}
////////////////////////////////////////////////////////////////
// hackerrank.com/challenges/rust-murderer/
////////////////////////////////////////////////////////////////
// Input:
// n - number of places on the map
// edges - list of 1-based (u,v) pairs representing main roads
// s - Detective Rust position
// Output:
// for 1 ≤ j ≤ n, except j = s, dump minimum distances from s
// via side roads
////////////////////////////////////////////////////////////////
// Plan of Campaign( very simple )
// 1) Create adjacency list for the main roads
// 2) Create unvizited set containing all vertices
// 3) Make a distance array
// 4) Make a queue
// 5) Push s to queue, set dist[ s ] = 0, remove from unvizited
// 6) While queue is not empty
// 7) Pop front to u
// 8) Loop over unvizited if it is not in adj[ u ], update dist,
//    remove from unvizited, and push it to queue
// 9) Print distance array
////////////////////////////////////////////////////////////////
fn create_adj( n: usize, edges: &Vec<(usize,usize)> )
               -> Vec<Vec<usize>> {
    let mut adj = vec![ vec![]; n + 1 ];
    for &( u, v ) in edges {
        adj[ u ].push( v );
        adj[ v ].push( u );
    }
    return adj;
}
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
// 30. If a₁ a₂ .. aₙ are integers, not all zero, then t h e i r
// greatest common divisor (gcd) is t h e largest integer d such
// that d | aⱼ f o r every j. Prove that there exist integers uⱼ
// such that d = a₁u₁ + a₂u₂ + .. + aₙuₙ
//
// S i m i l a r l y to T h e o r e m 1.2, lets look a t the set:
// S = { s = a₁u₁ + .. + aₙuₙ: s ≥ 0, uⱼ ∈ Z } it is n o t empty
// cos we can set uⱼ = aⱼ, therefore i   t has a minimum element:
// t := a₁u₁ + .. + aₙuₙ. N o w we have to prove that t | aⱼ for
// all j, and that if c is a  n  o  t  h  e  r such number t ≥ c
// 1) Let's take some j and divide by t:
//    aⱼ = qt + r, 0 ≤ r < t, zo r = aⱼ - qt i s an element of S,
//    smaller than t, zo r = 0, that is t | aⱼ
// 2) Let c | aⱼ, then we can write:
//    t = a₁u₁ + .. + aₙuₙ = cb₁u₁ + .. + cbₙuₙ =
//      = c(b₁u₁ + .. + bₙuₙ), zo c ≤ t                        «
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
fn make_it_happen( n: usize ) -> HashSet<usize> {
    return (1..=n).collect();
}
////////////////////////////////////////////////////////////////
fn make_distance( n: usize ) -> Vec<i32> {
    return vec![ -1; n + 1 ];
}
////////////////////////////////////////////////////////////////
// 49 A fair die is rolled n times. What is the probability that
// at least 1 of the 6 values never appears?
// 
// Yea I have tried to find t h e complementary probability, but
// didn't work out Z    o we have to use the inclusion exclusion
// principle: zo if Aⱼ i s the event that value j doesn't appear
// i t has probability P(Aⱼ) = 5^n/6^n, the probability that one
// value doesn't appear i  s Sum{ P(Aⱼ): 1 ≤ j ≤ 6 } = 6*5^n/6^n
// for two values we have to take the sum of all combinations of
// Aᵢ ∩ Aⱼ, but b a s i c a l l y this is just C(6,2)4^n/6^n, or
// generally P(k) := C(6,k)(6 - k)^n/6^n will be the probability
// of exactly k values not appear, zo:
// P = P(1) - P(2) + P(3) - P(4) + P(5) = ...                  «
////////////////////////////////////////////////////////////////
fn spanning_tree( n: usize, adj: &Vec<Vec<usize>>, s: usize )
                  -> Vec<i32> {
    let mut unvizited = make_it_happen( n );
    let mut dist = make_distance( n );
    let mut q = VecDeque::new();
    q.push_back( s );
    dist[ s ] = 0;
    unvizited.remove( &s );
    while let Some( u ) = q.pop_front() {
        let mut todo = Vec::new();
        for &v in &unvizited {
            if adj[ u ].contains( &v ) == false {
                todo.push( v );
            }
        }
        for v in todo {
            dist[ v ] = dist[ u ] + 1;
            q.push_back( v );
            unvizited.remove( &v );
        }
    }
    return dist;
}
////////////////////////////////////////////////////////////////
// 2.1.46. Two bodies of e q u a l mass slide along a n inclined
// plane connected with a thread. Strength o  f thread's tension
// is T. There is n o friction between one of the bodies and the
// board. Determine the force o f friction between the board and
// the other body.
//
// Zo lets the first body has no friction then:
// mgsinα - T = ma 
// mgsinα + T - F = ma, from here T - F = -T, that is F = 2T   «
////////////////////////////////////////////////////////////////
fn jump_around( n: usize, adj: &Vec<Vec<usize>>, s: usize )
                -> Vec<i32> {
    let mut dist = vec![ 1; n + 1 ];
    for &v in &adj[ s ]{
        dist[ v ] = 2;
    }
    return dist;
}
////////////////////////////////////////////////////////////////
#[ allow( non_snake_case )]
fn DetectiveRust( n: usize, edges: &Vec<( usize,usize )>, s: usize ){
    let adj = create_adj( n, edges );
    let dist;
    if edges.len() >= n - 1 {
        dist = spanning_tree( n, &adj, s );
    } else {
        dist = jump_around( n, &adj, s );
    }
    for i in 1..=n {
        if i != s {
            print!( "{} ", dist[ i ]);
        }
    }
    println!();
}
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
fn main() {
    let mut numbz = parse_line();
    let t = numbz[ 0 ];
    for _ in 0..t {
        numbz = parse_line();
        let n = numbz[ 0 ] as usize;
        let m = numbz[ 1 ];
        let mut edges: Vec<( usize,usize )> = vec![];
        for _ in 0..m {
            numbz = parse_line();
            let u = numbz[ 0 ] as usize;
            let v = numbz[ 1 ] as usize;
            edges.push(( u, v ));
        }
        numbz = parse_line();
        let s = numbz[ 0 ] as usize;
        DetectiveRust( n, &edges, s );
    }
}
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
// Challenges:                                         160 / 563
// Rank:                                                    6845
// Hackos:                                                  2340
// Points:                                                  4512
// Score:                                                     70
