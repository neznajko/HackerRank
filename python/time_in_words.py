################################################################
# www.hackerrank.com/challenges/the-time-in-words/problem
################################################################
################################################################
################################################################
CLOCK_NAME = [ #                                            CGPT
    "twelve",                                                  #
    "one",                                                     # 
    "two",                                                     #
    "three",                                                   #
    "four",                                                    #
    "five",                                                    #
    "six",                                                     #
    "seven",                                                   #
    "eight",                                                   #
    "nine",                                                    #
    "ten",                                                     #
    "eleven",                                                  #
    "twelve",                                                  #
    "thirteen",                                                #
    "fourteen",                                                #
    "fifteen",                                                 #
    "sixteen",                                                 #
    "seventeen",                                               #
    "eighteen",                                                #
    "nineteen",                                                #
    "twenty",                                                  #
    "twenty one",                                              #
    "twenty two",                                              #
    "twenty three",                                            #
    "twenty four",                                             #
    "twenty five",                                             #
    "twenty six",                                              #
    "twenty seven",                                            #
    "twenty eight",                                            #
    "twenty nine",                                             #
    "thirty",                                                  #
    "thirty one",                                              #
    "thirty two",                                              #
    "thirty three",                                            #
    "thirty four",                                             #
    "thirty five",                                             #
    "thirty six",                                              #
    "thirty seven",                                            #
    "thirty eight",                                            #
    "thirty nine",                                             #
    "forty",                                                   #
    "forty one",                                               #
    "forty two",                                               #
    "forty three",                                             #
    "forty four",                                              #
    "forty five",                                              #
    "forty six",                                               #
    "forty seven",                                             #
    "forty eight",                                             #
    "forty nine",                                              #
    "fifty",                                                   #
    "fifty one",                                               #
    "fifty two",                                               #
    "fifty three",                                             #
    "fifty four",                                              #
    "fifty five",                                              #
    "fifty six",                                               #
    "fifty seven",                                             #
    "fifty eight",                                             #
    "fifty nine"                                               #
]                                                              #
################################################################
################################################################
################################################################
################################################################
# (1)  6:00 A.M. (c) | (6)  3:00 P.M. (f)
# (2)  7:30      (a) | (7)  6:00      (b)
# (3)  9:00      (G) | (8)  7:30      (i)
# (4) 12:30 P.M. (e) | (9) 11:30      (D)
# (5)  1:30      (h) |
################################################################
# (a) 朝ご飯 Frühstück
# (c) 起 aufstehen
# (e) 昼 Mittag
# (h) 勉強 studieren
# (f) ヨガ Yoga
# (b) 晩ご飯 Abendessen
# (i) 映画 Film
# (g) テニス Tennis
# (d) 寝 schlafen
################################################################
################################################################
################################################################
def timeInWords( h, m ):
    current_hour = CLOCK_NAME[ h ]
    next_hour = CLOCK_NAME[( h + 1 )% 12 ]
    if m == 0:
        return f"{current_hour} o' clock"
    if m == 15:
        return f"quarter past {current_hour}"
    if m == 30:
        return f"half past {current_hour}"
    if m == 45:
        return f"quarter to {next_hour}"
    minutes = CLOCK_NAME[ m ]
    if m < 10:
        return f"{minutes} minute past {current_hour}"
    if m < 30:
        return f"{minutes} minutes past {current_hour}"
    minutes = CLOCK_NAME[ 60 - m ]
    return f"{minutes} minutes to {next_hour}"
################################################################
################################################################
################################################################
################################################################
if __name__ == '__main__':   ###################################
    h = int(input().strip()) ###################################
    m = int(input().strip()) ###################################
    print(timeInWords(h, m)) ###################################
################################################################
################################################################
################################################################
############ Don't want to brag but my current ranking is 133322
################################################################
# Points:                                         1109.21 / 2200
# Rank:                                                   145996
