require_relative './bowling_strike'
require_relative './bowling_spare'
class Bowling_score

	def initialize (score,gamescore)
	  	@score=score
	  	@gamescore=gamescore
	  	@bbonus= Bowling_strike.new
	    @bbonuspare= Bowling_spare.new(@gamescore,@score)
	    @spare=0
  	end

  	def score()
  		@strike=0
	  	for i in 0..@score.length-1
	      calcScore(i)
	      if @strike==0
			scoreBonus(i)
	      else
	        @strike=0
	      end
	    end
		specialPosition
  	end

  	def specialPosition
	    if (@score[9][2]!=nil) && @score[9][0]+@score[9][1]==10
	      	@bbonuspare.Spare(@score[9][2])
	   		@spare=0
	    end
  	end


  	def scoreBonus(i)
	    if (@score[i][1] != nil && @score[i][1]+@score[i][0]==10)
	        @spare=1
	        @gamescore[@bbonuspare.positionElement]=@score[i][0]+@score[i][1]
	    elsif (@score[i][1] != nil && @score[i][1]+@score[i][0]!=10)
	        @gamescore[@bbonuspare.positionElement]=@gamescore[@bbonuspare.positionElement]+@score[i][1]
	    end  		
  	end

	def calcScore(i)
     	if (@score[i][0] != nil && @score[i][0]!=10)
	        bonusSpare(i)
	        @gamescore << @score[i][0]

      	elsif @score[i][0]!=nil && @score[i][0]==10
	        bonusSpare(i)
	        @strike=1
	        @bbonus.Strike(i,@score,@gamescore)
     	end
  	end

  	def bonusSpare(i)
  		 @bbonuspare.callSpare(i,@spare)
	     @spare=0
  	end


  

end
