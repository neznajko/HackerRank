################################################################
# hackerrank.com/challenges/common-child/
################################################################
# A string is said to be a child of a another string if it can 
# be formed by deleting 0 or more characters from the other 
# string. Letters cannot be rearranged. Given two strings of 
# equal length, what's the longest string that can be 
# constructed such that it is a child of both?
################################################################
# s1 = ABCD
# s2 = ABDC
# These strings have two children with maximum length 3, ABC and 
# ABD. They can be formed by eliminating either the D or C from 
# both strings. Return 3.
################################################################
# 1 <= |s1|,|s2| <= 5000
# All characters are upper case in the range ascii[A-Z].
################################################################
# 2.1.9: To test the equipment in zero-gravity conditions, the
# container is thrown up by a pneumatic piston device located at
# the bottom of a vacuum shaft. The piston acts on the container
# for a time Δt with a force F = nmg, where m is the mass of the
# container with the equipment. After what time will the
# container fall to the bottom of the shaft? For what time does
# the state of weightlessness last for the equipment if Δt =
# 0.04 s and n = 125?
#
# +--C-----------+ H The piston acts for time Δt and moves the
# |              |   container from A to B. Then with the 
# |              |   acquired velocity V, the container moves up
# |              |   to C for time τ and back to A for time T. 
# |              |   So the desired time is t = Δt + τ + T
# |  ^ V         |    
# |  |           |   Here we are going to express first τ and T
# |  |           |   as functions of V and h, and then find the
# +--B-----------+ h actuall values.
# |              |   
# |              |   At point C the velocity is zero, so V = gτ
# +--A-----------+   and H = (1/2)gT². To find H we'll use the
# shorcut formula from the energy conservation:
# (1/2)mV² + mgh = mgH, H = h + V²|2g
# T = √(2H|g) = √(2h|g + V²|g²) = (1|g)√(2hg + V²)
# t = Δt + τ + T = Δt + V|g + (1|g)√(2hg + V²) =
#   = Δt + (1|g)(V + √(2hg + V²))                            (1)
#
# The piston acts with force nmg and the gravitation acts with
# force mg in the opposite direction so to total force is
# F = (n - 1)mg, the acceleration container gets is
# a = F/m = g(n - 1), the velocity V and height h are:
# V = aΔt = g(n - 1)Δt
# h = (1/2)aΔt² = (1/2)g(n - 1)Δt²
# Now we have to substitue thus in (1):
# t = Δt + (1|g)(g(n - 1)Δt + √(g²(n - 1)Δt² + (g(n - 1)Δt)²)) =
#   = Δt + (n - 1)Δt + Δt√(n - 1 + (n - 1)²) =
#   = nΔt + Δt√(n - 1 + n² - 2n + 1) = nΔt + Δt√(n² - n) =
#   = nΔt + nΔt√(1 - 1|n) = nΔt(1 + √(1 - 1|n))                « 
################################################################
def consmatrix( n, m )
  Array.new( n ){ Array.new( m ){ 0 }}
end
################################################################
# 1. (a) たけしさんは 時計を 買いました。
#    (b) たけしさんは かばんを 買いました。
#        たけしさんは かばんも 買いました。
################################################################
# 2. (a) ロバートさんは 日本語を 勉強します。
#    (b) メアリーさんは 日本語を 勉強します。
#        メアリーさんも 日本語を 勉強します。
################################################################
# 3. (a) たけしさんは 土曜日に アリバイトを します。
#    (b) たけしさんは 日曜日に アリバイトを します。
#        たけしさんも 日曜日に アリバイトを します。
################################################################
# 4. (a) メアリーさんは うちで 日本語を 話します。
#    (b) メアリーさんは 学校で 日本語を 話します。
#        メアリーさんは 学校でも 日本語を 話します。
################################################################
# 5. (a) あした、メアリーさんは たけしさんに 会います。
#    (b) あした、メアリーさんは スーさんに 会います。
#        あした、メアリーさんは スーさんにも 会います。
################################################################
# 6. (a) 先週、デパートに 行きました。
#    (b) きのう、デパートに 行きました。
#        きのうも デパートに 行きました。
################################################################
################################################################
################################################################
################################################################
################################################################
def commonChild( s, t )
  n = s.length
  m = t.length
  c = consmatrix( n + 1, m + 1 )
  i = n - 1
  while i >= 0
    j = m - 1
    while j >= 0
      taike = 0
      skp = 0
      if s[ i ] == t[ j ]
        taike = 1 + c[ i + 1 ][ j + 1 ]
      else
        skp = [ c[ i ][ j + 1 ], c[ i + 1 ][ j ]].max
      end
      c[ i ][ j ] = [ taike, skp ].max
      j -= 1
    end
    i -= 1
  end
  c[ 0 ][ 0 ]
end
################################################################
s = gets.chomp
t = gets.chomp
################################################################
p commonChild( s, t )
################################################################
################################################################
################################################################
################################################################
# Hackos:                                                   2012
# Challenges:                                          122 / 563 
# Rank:                                                    14659
# Points:                                                   3323
# Score:                                                      60
# ByTheWay: Recently, I've just finished watching the 8th season
# of Game Of Thrones yea strange as it might sounds didn't watch
# that film before a month or something and it's an amazing film
# but don't understand one thing, how is not allowed to smoke in
# films, but is allowed to have so much violence
