require_relative './bowling_error'
class Bowling_roll

	def initialize (score,berror)
	  	@score=score
	  	@berror=berror
  	end

	def roll(pins)

		for i in 0..@score.length-1
	      if i<9
	        break if addArray(i,pins)==10
	      else
	        addArraypositionnine(i,pins)
	      end
	    end
	   
	end

	def addArray(i,pins)
       if (@score[i][0] == nil)
         @score[i][0]=pins
         return 10

       elsif (@score[i][1] == nil && @score[i][0]!=10)
         @berror.pinlarge(@score[i][0]+pins)
         @score[i][1]=pins
         return 10
       end

       return i
  	end

 	def addArraypositionnine(i,pins)
      if @score[i][0] == nil && i==9
          @score[9][0]=pins

      elsif @score[i][1] == nil && i==9
          @score[9][1]=pins

      elsif @score[i][2] == nil && i==9
          @score[9][2]=pins
      end
  	end
	
end
