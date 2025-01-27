////////////////////////////////////////////////////////////////
// hackerrank.com/challenges/separate-the-numbers/
////////////////////////////////////////////////////////////////
// A numeric string, s, is beautiful if it can be split into a 
// sequence of two or more positive integers, a[1],a[2],..,a[n] 
// satisfying the following conditions: 
////////////////////////////////////////////////////////////////
// 1) a[i] - a[i-1] = 1, for any 1 < i <= n (i.e., each element 
//    in the sequence is 1 more than the previous element). 
// 2) No a[i] contains a leading zero. For example, we can split
//    s = 10203 into the sequence {1, 02, 03}, but it is not 
//    beautiful because 02 and 03 have leading zeroes. 
// 3) The contents of the sequence cannot be rearranged ...
////////////////////////////////////////////////////////////////
// <> 2.1.12: A painter is working in a suspended platform. He 
// urgently needs to climb up. He starts pulling the rope with 
// such force that the force of his pressure on the floor of the
// platform decreases to 400 N. The mass of the cradle is 12 kg, 
// the mass of the painter is 72 kg. What is the acceleration of
// the cradle? 
// ##//////////////////#########################################
// ##          |       #########################################
// ##          |       ## Platform: 
// ##         ###      #########################################
// ##        ##o##     ## T - Mg - N = Ma, where                
// ##        |###|     ## T is the tension of the rope     
// ##        |   |     ## N is the pressure on the floor        
// ## _______|___|___  ## M is the mass of the platform         
// ## |          |  |  ## a is the acceleration                 
// ## |         /|  |  #########################################
// ## |        o/|  |  ## Painter:                              
// ## |        | |  |  #########################################
// ## |        \\   |  ## T + N - mg = ma, where m is the mass  
// ## |________/_\__|  ## of the painter, zo                    
// ## |=============|  #########################################
// ###################### (m - M)a = 2N - (m - M)g 
////////////////////////////////////////////////////////////////
// a = 2N/(m - M) - g = (800/60 - 9.8) m/s² ≈ 3.53 m/s² 
////////////////////////////////////////////////////////////////
use std::io;
////////////////////////////////////////////////////////////////
fn ascii( c: char ) -> u64 {
    return c as u64 - '0' as u64;
}
////////////////////////////////////////////////////////////////
fn convyort( s: &str ) -> Vec <u64> {
    return s.trim_start_matches( '0' )
            .chars()
            .map(| c | ascii( c )) 
            .collect();
}
////////////////////////////////////////////////////////////////
fn separate_numbers( s: &str ){
    // convert to a vector of digits
    let a = convyort( s );
    // loop over the length of the first number
    for len in 1 .. a.len() / 2 + 1 {
        // initialize the matching target
        let key: u64 = get_first_number( &a, len );
        // len here is the starting offset
        if check_thus( &a, len, key + 1 ){
            println!( "YES {key}" );
            return;
        }
    }
    println!( "NO" );
}
////////////////////////////////////////////////////////////////
fn check_thus( a: &Vec <u64>, mut j: usize, mut key: u64 ) 
    -> bool {
    if a[ j ] == 0 {
        return false; // a number can't start with nil
    }
    while( j < a.len()) {
        j = clck_next( a, j, key );
        if j == 0 { return false; }
        key += 1;
    }
    return true;
}
////////////////////////////////////////////////////////////////
fn clck_next( a: &Vec <u64>, mut j: usize, key: u64 ) -> usize {
    let mut value: u64 = 0;
    loop {
        if j >= a.len() { return 0; }
        value = 10 * value + a[ j ];
        j += 1;
        if value == key { return j; }
        if value > key { return 0; }
    }
}
////////////////////////////////////////////////////////////////
fn get_first_number( a: &Vec <u64>, len: usize ) -> u64 {
    let mut value: u64 = 0;
    for j in 0 .. len {
        value = value * 10 + a[ j ];
    }
    return value;
}
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
// 21. Define G(n,k) as the number of ways to partition {1..n} 
// into k nonempty subsets, or the number of ways to have n 
// students split up into k groups such that each group has
// at least one student. For example, G(4,2) = 7 because we have
// the following possibilities. 
// {1} {2,3,4}  {1,2} {3,4}
// {2} {1,3,4}  {1,3} {2,4} 
// {3} {1,2,4}  {1,4} {2,3}
// {4} {1,2,3}
// Prove the following identities: 
// a) G(n+1,k) = G(n,k-1) + kG(n,k)
// b) G(n+1,k+1) = sum{j=k,n) C(n,j)G(j,k)
////////////////////////////////////////////////////////////////
// If not mistaken these are called Stirling's numbers and looks
// scary, but surprisingly the above equations can be proven 
// easily with story proofs. Again we select some element of the
// set to be special so to speak, for example we might have 
// balls numbered from 1 to n + 1 and one of them to be colored 
// blue. In the first case we split in all groups where the blue
// ball is alone in its group {b} that will give the first term
// G(n,k-1) in the second split the blue ball has a company, so
// we multiply by k, cos we can put it in k different groups.
// In the second case we split in scenarios where the blue ball
// is alone, has 1 mate, 2 friends, etc. So for the scenario 
// with j teammates we pick the rest k groups from the remaining 
// n + 1 - ( 1 + j ) = n - j balls, that is G(n-j,k) and
// multiply for all combos of j balls C(n,j) = C(n,n-j). Now if
// we substitute i := n-j we'll get C(n,i)G(i,k) and the sum 
// over all i will give G(n+1,k+1)
////////////////////////////////////////////////////////////////
fn main() {
    let mut bufr = String::new();
    io::stdin().read_line( &mut bufr )
               .expect( "Failed to read q" );
    let q: usize = bufr.trim()
                       .parse()
                       .expect( "Nan" );
    for _ in 0 .. q {
        bufr.clear();
        io::stdin().read_line( &mut bufr )
                   .expect( "Failed reading a string" );
        separate_numbers( bufr.trim());
    }
}
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
// (1) メアリーさんはニ時間テニスをしました。
////////////////////////////////////////////////////////////////
// (2) メアリーさんは三じかん勉強しました。
////////////////////////////////////////////////////////////////
// (3) メアリーさんは一時間半音楽を聞きました。
////////////////////////////////////////////////////////////////
// (4) メアリーさんは一時間たけしさんを待ちました。
////////////////////////////////////////////////////////////////
// (5) メアリーさんは二時間半テレビを見ました。
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
// Hackos:                                                  2043
// Score:                                                     20
// Challenges:                                         124 / 563
// Rank:                                                   14288
// Points:                                                  3363
