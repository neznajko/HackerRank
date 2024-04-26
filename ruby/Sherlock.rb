################################################################
# Sherlock and the Valid String
################################################################
# https://www.hackerrank.com/challenges
# /sherlock-and-valid-string/problem
################################################################
# 鉄 テツ
# e: iron
# f: fer
# i: ferro
# s: hierro
# u: залізо
# g: Eisen
################################################################
def isValid( s )
  
  freq_map = Hash.new( 0 )
  s.each_char do |ch|
    freq_map[ ch ] += 1
  end

  count_map = Hash.new( 0 )
  freq_map.each_value do |freq|
    count_map[ freq ] += 1
  end

  if count_map.length == 1
      return "YES"
  end
  if count_map.length > 2
    return "NO"
  end

  freq_count = count_map.sort_by { |k,v| v }
  
  print freq_count

  if freq_count[ 0 ][ 1 ] != 1
    return "NO"
  end

  if freq_count[ 0 ][ 0 ] == 1
    return "YES"
  end

  if freq_count[ 0 ][ 0 ] - freq_count[ 1 ][ 0 ] == 1
    return "YES"
  end

  "NO"

end
################################################################
s = gets.chomp     #############################################
result = isValid s #############################################
puts result        #############################################
################################################################
#                                  You have earned 35.00 points!
#       You are now 95.25 points away from the 4th star for your 
#                                         problem solving badge.
#                      Congratulations You solved this challenge
################################################################
################################################################
################################################################
################################################################
