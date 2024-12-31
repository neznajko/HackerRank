################################################################
# hackerrank.com/challenges/making-anagrams/
################################################################
# We consider two strings to be anagrams of each other if the 
# first string's letters can be rearranged to form the second 
# string. In other words, both strings must contain the same 
# exact letters in the same exact frequency. For example, bacdc 
# and dcbac are anagrams, but bacdc and dcbad are not
################################################################
# Alice is taking a cryptography class and finding anagrams to 
# be very useful. She decides on an encryption scheme involving 
# two large strings where encryption is dependent on the minimum
# number of character deletions required to make the two strings
# anagrams. Can you help her find this number?
################################################################
################################################################
################################################################
################################################################
# Given two strings, s1 and s2, that may not be of the same 
# length, determine the minimum number of character deletions 
# required to make  s1 and s2 anagrams. Any characters can be 
# deleted from either of the strings. 
################################################################
# 1 <= |s1|,|s2| <= 10^4
# It is guaranteed that s1 and s2 consist of lowercase English 
# letters, ascii[a-z].
################################################################
################################################################
# <> 2.1.8: The dynamometer consists of two cylinders connected 
# by a light spring. With forces F₁ and F₂ applied to them, the 
# dynamometer shows a force of F. Find the ratio of the masses 
# of these cylinders 
#        +-----------------+         
#   F₂   |          + - - -|--------+       F₁
#   <----|/\/\/\/\/\¦\/\/\/|/\/\/\/\|-------->
#        |          + - - -|--------+
#        +-----------------+         
#
# If F₁ and F₂ were equal, then F = F₁ = F₂, and the ratio m₂/m₁
# can be anything. Otherwize the system will move as a whole
# with some acceleration a, let's say on the right:
# F₁ - F = m₁a
# F - F₂ = m₂a, and
# m₂/m₁ = (F - F₂)/(F₁ - F)                                    «
################################################################
################################################################
################################################################
def makingAnagrams( s, t )
  f = Array.new( '{'.ord ){ 0 }
  s.each_byte do |ascii| 
    f[ ascii ] += 1
  end
  n = s.length 
  t.each_byte do |ascii|
    if f[ ascii ] > 0
      f[ ascii ] -= 1
      n -= 1
    else
      n += 1
    end
  end
  n
end
################################################################
################################################################
################################################################
################################################################
# 1. メアリーさんは 水曜日に 何を しましたか。
#    学校で テニスを しました。
# 2. メアリーさんは 火曜日に 何を しましたか。
#    家で 手紙を 書きました。
# 3. メアリーさんは いつ 映画を 見ましたか。
#    土曜日に 映画を 見ました。 
# 4. メアリーさんは いつ 買い物を しましたか。
#    日曜日に 買い物を しました。
# 5. メアリーさんは 金曜日に どこで 晩ご飯を 食べましたか。
#    友だちの うちで 晩ご飯を 食べました。
# 6. メアリーさんは 木曜日に どこで 友だちに 会いましたか。
#    喫茶店で どこで 友だちに 会いました。
################################################################
################################################################
################################################################
################################################################
s1=gets.chomp
s2=gets.chomp
result=makingAnagrams s1, s2
p result
################################################################
################################################################
################################################################
################################################################
# Rank:                                                    15377
# Points:                                                   3263
# Challenges:                                          121 / 563 
# Score:                                                      30
# Hackos:                                                   2001
################################################################
################################################################
################################################################
################################################################
