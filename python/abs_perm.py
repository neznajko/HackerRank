################################################################
# hackerrank.com/challenges/absolute-permutation/
################################################################
################################################################
################################################################
################################################################
# 1 <= n <= 10**5
# 0 <= k <  n
################################################################
# Strangely the greedy approach works here we can start with the
# identity permutation: p[ j    ] = j, and for every 1 <= j <= n
# check if j - k is > 0, if so we set p[ j    ] <- j - k, if not
# set p[ j   ] <- j + k, in the latter case if p[ j ] happens to
# be greater than n, then the absolute permutation doesn't exist
################################################################
################################################################
################################################################
################################################################
def absolutePermutation( n, k ):
    abs_perm = []
    values = set()
    for j in range( 1, n + 1 ):
        p = j - k
        if p < 1 or p in values:
            p = j + k
            if p > n: return [ -1 ]                
        values.add( p )
        abs_perm.append( p )
    return abs_perm
################################################################
################################################################
################################################################
################################################################
if __name__=='__main__':
    t=int(input().strip())
    for t_itr in range(t):
        first_multiple_input=input().rstrip().split()
        n=int(first_multiple_input[0])
        k=int(first_multiple_input[1])
        result=absolutePermutation(n,k)
        print(' '.join(map(str,result)))
################################################################
################################################################
################################################################
################################################################
# Hackos:                                                   1609
# Max Score:                                               40.00
# Points:                                         2078.21 / 2200
# Rank:                                                    52803
#
# OK so  now the ultimate truth is not existing, 1st of all what
# is ultimate truth are there other types of truth, and the fact
# that  we  can  ask  questions infinitely like idiots is not an
# argument cos we can  calculate like priests the next precision
# of pi every day and the enlightment that we'll never reach the
# ultimate truth about pi, doesn't mean that pi doesn't exist or
# that   we   can't   make   math   statements   about  it   etc
