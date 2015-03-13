 class Bowling
    
	def initialize
    	@launch = []
    	@position =[]
   	end
 
   	def roll(pins)
    	@launch << pins
   	end

	def score 
  		score=0
  		frame=0
  		i=0
  		j=0
  		while frame<10 #Each match consists in 10 
  			if spare?(i) #SPARE (/)
        		score += 10 + @launch[i + 2]# 10 points more the score obtained in the next ball  
        		i+= 2
        		@position[frame]=score# each position has score.
      	elsif strike?(i) #STRIKE (X)
        		score += 10 + @launch[i + 1] + @launch[i + 2]#bonus strike - 10 points more score obtained in the next two balls
        		i+=1
        		@position[frame]=score
  			else
  				score+=@launch[i]+@launch[i+1]
  				i+=2
  				@position[frame]=score
  			end
  		frame+=1
    	end
    	score
	end

	def spare?(i)
 		@launch[i] + @launch[i + 1] == 10
	end
	
	def strike?(i)
 		@launch[i] == 10
 	end
end	 
