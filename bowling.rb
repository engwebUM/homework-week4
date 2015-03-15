 class Bowling
    
	def initialize
    	@launch = []
      @frist_launch=0
      @frames=[]
  end

 	def roll(pins)
    if pins>=0 && pins <=10
    	@launch << pins
    end
 	end

	def score 
  		score=0
  		frame=0
      max_frame=10
  		while frame<max_frame  
  			if spare?
        		score += 10 + bonus_spare
        		@frist_launch+= 2
      	elsif strike? 
        		score += 10 + bonus_strike
        		@frist_launch+=1
  			else
  				score+=normal_frame
  				@frist_launch+=2
  			end
  		frame+=1
    	end
    	score
	end

	def spare?
 		@launch[@frist_launch] + @launch[@frist_launch + 1] == 10
	end

  def bonus_spare
    @launch[@frist_launch + 2]  
  end

	def strike?
 		@launch[@frist_launch] == 10
 	end

  def bonus_strike
    @launch[@frist_launch + 1] + @launch[@frist_launch + 2]  
  end

  def normal_frame
    @launch[@frist_launch]+@launch[@frist_launch+1]
  end
end	 
