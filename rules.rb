def check_strike? pins 
	pins == 10
end

def check_spare? pins
	@jogadas.at(@index).first_game + pins == 10
end	

def last_ball? 
	@index <= 10
end	

def new_frame?
	@attempts == 1
end	

def last_ball_and_spare? 
	@index==11 && @jogadas.at(10).spare == 1
end	

def check_roll?
	@jogadas.size >=0 && @jogadas.size <= 11
end	

def last_ball_and_strike_1attempts?
	@index==11 && @jogadas.at(10).strike == 1 && @attempts == 1
end	

def last_ball_and_strike_2attempts?
	@index==11 && @jogadas.at(10).strike == 1 && @attempts == 2
end

def frame_with_strike? index
	@jogadas.at(index).strike > 0
end	

def frame_with_spare? index
	jogadas.at(index).spare > 0
end	