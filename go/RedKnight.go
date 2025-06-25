//##############################################################
//##############################################################
//##############################################################
//######################################    \###################
//##############    \###################    -\##################
//##############    .\###############    \--\-\#################
//##############    ..\##############    -\--\-\################
//###                          \###                        \####
//###                          .\##                        -\###
//###\.........................\.    \---------------------\-\##
//####\...    \.................\    -\-    \---------------\-\#
//###                          \.\---\-     #\------    \----\-\
//###                          .\.\---\    #\#\---      #\----\-
//###\....    \............    ..\.\-    \#\#\#\      \#\#\----\
//####\...    .\...........    ...\.\    #    \#    \#\\#\#\----
//#####\..    ..\..........    ....    \#\    #\\###\\#\\#\#\---
//######\.    ...\.........    ....    #\#    #    \#\\#\\#\#\--
//#######\    ....\........    ..    \###\    #      \\\#\\#\#\-
//#######    .\....\.......    ..    #\###    #\#      \\#\\#\#\
//#####      ..\....\..        ..\###\#\##    ##\\#      \#\\#\#
//#####    ..\..\....\.       .\..\###\#\#    ###\\\#    #\#\\#\
//#####\...\..\..\....\\......\.\..\###\#\    ####\\\\###    \\#
//######\...\..\..\....\\......\.\..\###\#\###\####\\\\##    #\\
//#######\...\..\..\....\\......\.\..\###\    \\####\\\\#\###\#\
//########\...\..\..\....\\......\.\..\###    #\\####\\\\#\###\#
//#########\...\..\..\....\\......\.\..\##\##\##\\####\\\\#\###\
//##########\...\..\..\....\\......\.\..\##\##\##\\####\\\\#\###
//###########\...\..\..\....\\......\.\..\##\##\##\\####\\\\#\##
//############\...\..\..\....\\......\.\..\##\##\##\\####\\\\#\#
// 長 い「旅」は、始 ま っ た 場 所 で 終 わ っ た。
// Дългото [ пътешествие ] приключи там, откъдето започна
//##############################################################
////////////////////////////////////////////////////////////////
// hackerrank.com/challenges/red-knights-shortest-path/
////////////////////////////////////////////////////////////////
// In ordinary chess, the pieces a r e only of two colors, black
// and w h i t e. In our version of chess, w e are including new
// pieces with unique movements. One of the most powerful pieces
// in this version is the red knight ..
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
package main
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
import (
    "bufio"
    "container/list"
    "fmt"
    "os"
    "strconv"
    "strings"
)
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
// 44. Let A and B be events. The difference B − A is defined to
// be the set o f all elements of B that are not in A. Show that
// if A ⊆ B, then P(B − A) = P(B) − P(A), directly u s i n g the
// axioms of probability
//
// for any two events A and B we can write:
// B = B ∩ Aᶜ + B ∩ A, here + means union o f disjoint sets, s o
// when A ⊆ B, B ∩ A = A, zo B = B ∩ Aᶜ + A, B ∩ Aᶜ is B − A, zo
// P(B) = P(B - A) + P(A), P(B - A) = P(B) - P(A)              «
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
type Node struct {
    i int32
    j int32
    parent *Node
    path string
}
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
// <> 2.1.43*: A horizontal a x i s of radius R rotating w i t h
// angular velocity w is clamped by a bushing equipped w i t h a
// counterweight so that it does n o t rotate while moving along
// the a x i s. Determine the steady-state speed o f the bushing
// under the action of a force F applied to it along the a x i s
// The maximum friction of the axle on the bushing is Fᵣ > F.
// #############################################################
// ######################## So I'll skip drawing t h e figure in  
// ##########      ######## perspective, but we c a n think that
// #######   ######   ##### the axis is static a n d the bushing,
// #####  ############  ### -- a small cylindrical layer o n top
// ####  ##############  ############### o  f it, rotates with w,
// ####  A#####.v#####B  ##  A------v ## i f the rotation is ccw    
// ####  ##############  ##  |`. α    ## the angular velocity at
// #####  ############  ###  |  `.    ## A w i l l b  e directed 
// #######   ######   #####  |    `.  ## downwards i n t   h   e 
// ##########      ######## wR      u ## [f r o n t] view; t h e
// ##################################### velocity from the force:
// ######[ f r o n t ]#####[ s i d e ]## v will point towards us
// ##################################### In the [side] view both 
// #### forces will add up to u with an angle α: tgα = wR/v, s o
// #### the sum friction force f r o m A and B will be equal t o
// #### 2fcosα where f will be the friction a t points A a n d B,
// #### i f there were no r o t a t i o n, so the friction force 
// #### decreases by a factor of cosα. In state of balance we'll
// #### have:
// #### F = Fᵣcosα = Fᵣ/√( 1 + tg²α ) = Fᵣ/√( 1 + w²R²/v² ), z o
// #### 1 + w²R²/v² = Fᵣ²/F²; w²R²/v² = (Fᵣ² - F²)/F²;
// #### v = wRF/√(Fᵣ² - F²)                                    «
// #############################################################
// #############################################################
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
func dump_path( node *Node ){
    var paths []string
    for node.path != "" {
        paths = append( paths, node.path )
        node = node.parent
    }
    fmt.Println( len( paths ))
    for i := len( paths ) - 1; i >= 0; i-- {
        fmt.Print( paths[ i ])
        if i != 0 {
            fmt.Print(" ")
        }
    }
    fmt.Println()
}
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
// 20. Prove that (a,b) = (a,b + at) for every t ∈ Z
// Let g := (a,b), h := (a,b + at); we have to show that g|h and
// h|g. Zo h = au + (b + at)v = a(u + tv) + bv, for some u,v ∈ Z
// g is the GCD of a and b zo g|h; h i s the GCD of a and b + at,
// zo b + at = hw, a = hy for some w,y ∈ Z, a n d b = hw - hyt =
// h(w - yt), that is h|b and h|a, g being GCD can be written as
// a linear combination of a and b, that is h|g                «
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
func printShortestPath( n int32,
                        istart int32,
                        jstart int32,
                        iend int32,
                        jend int32 ){
    vztd := make( [][]bool, n )
    for i := int32( 0 ); i < n; i++ {
        vztd[i] = make( []bool, n )
    }
    dq := list.New()
    dq.PushBack( &Node{ i: istart,
                        j: jstart,
                        parent: nil,
                        path: "" })
    vztd[ istart ][ jstart ] = true
    for dq.Len() > 0 {
        front := dq.Front()
        node := front.Value.( *Node )
        dq.Remove( front )
        i := node.i
        j := node.j
        // check if target is reached
        if i == iend && j == jend {
            dump_path( node )
            return
        }
        // |  |UL|  |UR|  | UL: -2, -1
        // |  |  |  |  |  | UR: -2, +1
        // | L|  |RN|  | R|  R:  0, +2
        // |  |  |  |  |  | LR: +2, +1
        // |  |LL|  |LR|  | LL: +2, -1
        // > j            V  L:  0, -2
        // UL             i
        p := i - 2
        q := j - 1
        if p >= 0 && q >= 0 {
            if vztd[ p ][ q ] == false {
                dq.PushBack( &Node{
                    i: p,
                    j: q,
                    parent: node,
                    path: "UL" })
                vztd[ p ][ q ] = true
            }
        }
        // UR
        p = i - 2
        q = j + 1
        if p >= 0 && q < n {
            if vztd[ p ][ q ] == false {
                dq.PushBack( &Node{
                    i: p,
                    j: q,
                    parent: node,
                    path: "UR" })
                vztd[ p ][ q ] = true
            }
        }
        // R
        p = i
        q = j + 2
        if q < n {
            if vztd[ p ][ q ] == false {
                dq.PushBack( &Node{
                    i: p,
                    j: q,
                    parent: node,
                    path: "R" })
                vztd[ p ][ q ] = true
            }
        }
        // LR
        p = i + 2
        q = j + 1
        if p < n && q < n {
            if vztd[ p ][ q ] == false {
                dq.PushBack( &Node{
                    i: p,
                    j: q,
                    parent: node,
                    path: "LR" })
                vztd[ p ][ q ] = true
            }
        }
        // LL
        p = i + 2
        q = j - 1
        if p < n && q >= 0 {
            if vztd[ p ][ q ] == false {
                dq.PushBack( &Node{
                    i: p,
                    j: q,
                    parent: node,
                    path: "LL" })
                vztd[ p ][ q ] = true
            }
        }
        // L
        p = i
        q = j - 2
        if q >= 0 {
            if vztd[ p ][ q ] == false {
                dq.PushBack( &Node{
                    i: p,
                    j: q,
                    parent: node,
                    path: "L" })
                vztd[ p ][ q ] = true
            }
        }
    }
    fmt.Println( "Impossible" )
}
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
// Exercise 1.3.11. Decide if the following statements a b o u t
// suprema and infima are true o r false. Give a short proof for
// those that are true. For any that a r e false, s u p p l y an
// example where t h e claim in question does not appear to hold
//
// (a) If A and B are nonempty, bounded, and satisfy A ⊆ B, then
//     sup A ≤ sup B.
//
//     Let u s assume sup B < sup A, then ε := sup A - sub B > 0,
//     from the definition of suprema f o r every ε > 0 there is
//     an element a ∈ A: sup A - ε < a, this m e a n s sub B < a,
//     but A ⊆ B, that is a ∈ B, so t  h  e assumption i s false
//
// (b) If sup A < inf B for s e t s A and B, then there exists a
//     c ∈ R satisfying a < c < b for all a ∈ A and b ∈ B.
//
//     This seems obvious, if we take c t o be between sup A and
//     inf B: c = sup A + (inf B - sup A)/2 = (sup A + inf B)/ 2
//
// (c) If there e x i s t s a c ∈ R satisfying a < c < b for all
//     a ∈ A and b ∈ B, then sup A < inf B.
//
//     This i s not the case cos we might have sup A = inf B = c
//     like A = { x ∈ R: x < 1 }, B = { x ∈ R: x > 1 }
//
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
func main(){////////////////////////////////////////////////////
    scanner:=bufio.NewScanner(os.Stdin)/////////////////////////
    scanner.Scan()//////////////////////////////////////////////
    val,err:=strconv.Atoi(scanner.Text())///////////////////////
    if err!= nil{///////////////////////////////////////////////
        panic(err)//////////////////////////////////////////////
    }///////////////////////////////////////////////////////////
    n:=int32(val)///////////////////////////////////////////////
    scanner.Scan()//////////////////////////////////////////////
    fields:=strings.Fields(scanner.Text())//////////////////////
    nums:=make([]int32,len(fields))/////////////////////////////
    for i,field:=range fields{//////////////////////////////////
        val,err=strconv.Atoi(field)/////////////////////////////
        if err!=nil{////////////////////////////////////////////
            panic(err)//////////////////////////////////////////
        }///////////////////////////////////////////////////////
        nums[i]=int32(val)//////////////////////////////////////
    }///////////////////////////////////////////////////////////
    printShortestPath(n,nums[0],nums[1],nums[2],nums[3])////////
}///////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
// Challenges:                                         151 / 563 
// Rank:                                                    8289
// Points:                                                  4187
// Score:                                                     60
// Hackos:                                                  2272
