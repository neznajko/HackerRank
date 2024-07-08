################################################################
# www.hackerrank.com/challenges/password-cracker
################################################################
from collections import deque
################################################################
################################################################
################################################################
################################################################
################################################################
################################################################
class Cracker:
    def __init__( self, pwds, log ): #       Cracker constructor
        self.d = Cracker.cons( pwds ) #               dictionary
        self.log = log #                                   login
        self.n = len( self.log ) #        size of the log string
        self.deq = deque([ self.n ]) #  deque with log's offsets
        self.cache = [ 0 ] * self.n #           link to next pwd

    def cons( pwds ): #           construct passwords dictionary
        d = {} #                                  the dictionary
        for pwd in pwds: #               loop over password list
            key = pwd[ 0 ] #      use as a key the fyorst letter
            if key in d: #                   check if key exists
                d[ key ].add( pwd ) #  if so, add pwd to its set
            else: #                                         nope
                d[ key ] = set([ pwd ]) #             cons a set
        return d #                                        tha'ts

    def vrooom( self ): #                    tha'ts th efunction
        for i in reversed( range( self.n )): #      reverse loop
            key = self.log[ i ] #                 dictionary key
            if key not in self.d: continue #         not in here
            pwds = self.d[ key ] #       words starting with key
            for j in self.deq: #                      deque loop
                subs = self.log[ i:j ] #               substring
                if subs in pwds: #                   check check
                    self.deq.appendleft( i ) #                ok
                    self.cache[ i ] = j #       link to next pwd
                    break #                                dance
        return self.consans() #                             yeah

    def consans( self ): #                      construct answer
        if self.cache[ 0 ] == 0: return "WRONG PASSWORD" #  nope
        ans = [] #                           start as empty list
        i = 0 #               left position of the log substring
        while i < self.n: #                      loop over cache
            j = self.cache[ i ] #      the right side of the pwd
            ans.append( self.log[ i:j ]) #                  push
            i = j #                                     move fwd
        return " ".join( ans ) #              convyort to string

    def debug( self ):
        print( self.d )
        print( self.log )
        print( self.deq )
        print( self.cache )

################################################################
################################################################
################################################################
################################################################
def passwordCracker( pwds, log ):
    return Cracker( pwds, log ).vrooom()
################################################################
################################################################
################################################################
################################################################
if __name__ == '__main__': #####################################
    t = int(input().strip()) ###################################
    for t_itr in range(t): #####################################
        n = int( input().strip()) ##############################
        passwords = input().rstrip().split() ###################
        loginAttempt = input() #################################
        result = passwordCracker( passwords, loginAttempt ) ####
        print( result ) ########################################
################################################################
################################################################
################################################################
################################################################
# Difficulty:                                             Medium
# Score:                                                      40
# Points:                                         1044.21 / 2200
# Rank:                                                   161179

