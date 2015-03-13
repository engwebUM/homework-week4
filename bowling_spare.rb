class Bowling_spare

	def initialize (gamescore,score)
	  	@gamescore=gamescore
	  	@score=score
  	end

  	def callSpare(i,spare)
	     if(spare==1)
	      Spare(@score[i][0])
	    end
  	end

  	def positionElement
	    @ind= @gamescore.length-1
	    return @ind
  	end

  	def Spare(i)
	    @gamescore[positionElement]=@gamescore[positionElement]+i
 	end

end
