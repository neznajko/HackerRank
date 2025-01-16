################################################################
# hackerrank.com/challenges/gem-stones/
################################################################
# There is a collection of rocks where each rock has various 
# minerals embeded in it. Each type of mineral is designated by 
# a lowercase letter in the range [a-z]. There may be multiple 
# occurrences of a mineral in a rock. A mineral is called a 
# gemstone if it occurs at least once in each of the rocks in 
# the collection ..
################################################################
require 'set'
################################################################
def extract_minerals( rock )
  sample = Set.new
  rock.each_byte do | mineral |
    sample.add( mineral )
  end
  sample
end
################################################################
def extract_common_minerals( sample, rock )
  common_minerals = Set.new
  rock.each_byte do | mineral |
    if sample.include? mineral
      common_minerals.add( mineral )
    end 
  end
  common_minerals
end
################################################################
def gemstones( rocks )
  sample = extract_minerals( rocks[ 0 ])
  for j in ( 1 .. rocks.size - 1 ) do
    sample = extract_common_minerals( sample, rocks[ j ])
    break if sample.size == 0
  end
  sample.size
end
################################################################
################################################################
################################################################
################################################################
################################################################
n = gets.strip.to_i
a = Array.new
n.times do 
  a.push gets.chomp
end
p gemstones( a )
################################################################
################################################################
################################################################
################################################################
# Hackos:                                                   2027
# Score:                                                      20
# Challenges:                                          123 / 563
# Rank:                                                    14478
# Points:                                                   3343
# ByTheWay: The Genius God whispers, from time to time, that is.
# So I have some new suggestions and improvements for you guys. 
# I understand you have some difficulties naming the Fischer 
# Random Chess? You call it chess ninety twenty .., or chess 
# twenty .. something, I forgot, but then you switch to 
# Freestyle Chess recently? It's called Ugly Chess! The second 
# point is: Why we don't see T-Shirts POPULATE MARS! anymore,
# what has happened? I think we have to change the slogan to:
# MAKE MARS GREAT FOR FYORST TIME!
################################################################
################################################################
################################################################
################################################################
