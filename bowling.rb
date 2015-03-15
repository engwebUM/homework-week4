load "jogada.rb"
load "rules.rb"

	class Bowling
		attr_accessor:jogadas, :index, :attempts, :totalPoints

		def initialize
			@jogadas = Array.new()
			@index = 0
			@attempts = 1
			@totalPoints = 0
		end



	  	def roll(pins)
	  		if check_roll?
	    		if last_ball?
	    			no_last_ball pins
	    		else 
	    			last_ball pins
	    		end
	    	end
	    end	


	  	def score
	    	index = 0
	    	totalPoints = 0

	    	while index < @jogadas.size()
				points_type index
				@totalPoints = @jogadas.at(index).points
				index += 1
			end

			if @jogadas.size>10
				points_roll_10 index
				@totalPoints = @jogadas.at(10).points
			end	
			totalPoints = @totalPoints
			 
	  	end


	  	def start_frame_strike(pins)
	  		jogada = Jogada.new(pins,1,0)
	    	@jogadas << jogada
	    	@index += 1
	  	end

	  	def start_frame_no_strike(pins)
	  		jogada = Jogada.new(pins,0,0)
	    	@jogadas << jogada
	    	@attempts = 2
	    end

	    def start_frame(pins)
	    	if check_strike?(pins)
	    		start_frame_strike(pins)
	    	else
	    		start_frame_no_strike(pins)
	    	end
	    end 
	    	
	    def start_frame_attempts(pins)
	    	@jogadas.at(@index).second_game = pins
	    	@attempts=1
	    	@index += 1
	    end

	    def start_frame_spare(pins)
	    	@jogadas.at(@index).spare +=1
	    	@jogadas.at(@index).second_game = pins
	    	@attempts=1
	    	@index += 1
	    end

	    def no_last_ball pins
	    	if new_frame?
	    		start_frame(pins)
	    	elsif check_spare?(pins)
	    	 	start_frame_spare(pins)	    		 	
	    	else 
	    	  	start_frame_attempts(pins)
	    	end
	    end	
	  
	  	def last_ball pins
	  		if  last_ball_and_spare? 
	    		start_frame_no_strike pins
	    	else last_ball_and_strike pins
	    	end	
	    end		

	    def last_ball_and_strike pins
	    	if last_ball_and_strike_1attempts?
	    		start_frame_no_strike pins
	    	elsif last_ball_and_strike_2attempts?
	    		start_frame_attempts pins
	    	end	
	    end	


	    def strike_points index
	    	@jogadas.at(index).points = @totalPoints + @jogadas.at(index).first_game  + @jogadas.at(index).second_game + @jogadas.at(index+1).first_game  + @jogadas.at(index+1).second_game 
	    end	

	    def spare_points index
	    	@jogadas.at(index).points = @totalPoints + @jogadas.at(index).first_game + @jogadas.at(index+1).first_game + @jogadas.at(index).second_game
		end

		def normal_points index
			@jogadas.at(index).points = @totalPoints + @jogadas.at(index).first_game + @jogadas.at(index).second_game
		end	

		def points_type index
			if frame_with_strike? index
    			strike_points index
			elsif frame_with_spare? index 
				spare_points index
			else normal_points index
			end
		end	

		def points_roll_10 index
			if @jogadas.at(10).strike = 1
				@jogadas.at(10).points = @totalPoints + @jogadas.at(11).first_game + @jogadas.at(11).second_game
			elsif @jogadas.at(10).spare = 1
				@jogadas.at(10).points = @totalPoints + @jogadas.at(11).first_game
			end
		end	
	end


		
