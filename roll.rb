class Roll 
  attr_accessor :rolls
  def initialize bowling
    @rolls = bowling.plays
  end
  
  def roll_add (pins)
	roll_position = @rolls.length
    frame = (roll_position)/2
	if is_not_last_frame? frame
	  roll_add_normal pins, roll_position
	elsif first_extra_roll? roll_position
	  roll_add_normal pins, roll_position
	elsif second_extra_roll? roll_position
	  roll_add_normal pins, roll_position
	else
	  error
	end
  end	
  
  def is_not_last_frame? frame
    frame < 10
  end  	  
  
  def first_extra_roll? roll_position
    roll_position == 20 && (@rolls[18] + @rolls[19] == 10 || @rolls[18] == 10) 
  end  
  
  def second_extra_roll? roll_position
    @rolls[18] == 10 && (roll_position == 21 || @rolls[20] == 10)
  end	
  
  def roll_add_normal pins, roll_position
    if first_frame_roll? roll_position
	  add_first_frame_roll pins
	else 
	  add_second_frame_roll(pins, roll_position)
	end
  end  	
  
  def add_first_frame_roll pins
	if pins == 10
	  @rolls.push pins
	  @rolls.push 0
	elsif pins >= 0 && pins < 10
	  @rolls.push pins
	else
	  error
	end
  end	  
  
  def add_second_frame_roll (pins, roll_position)
	if (0 <= pins) && (pins <= 10) && valid_frame_score?(pins, roll_position)
	  @rolls.push pins
	else
	  error
	end
  end	
  
  def first_frame_roll? roll_position
	((roll_position/2)*2) == roll_position
  end 
  
  def valid_frame_score? (pins, roll_position)
    (pins + @rolls[roll_position/2*2]) >= 0 && (pins + @rolls[roll_position/2*2]) <= 10
  end 
  
  def error 
    raise ArgumentError, 'ERROR: **** Incorrect game. ****'
  end
end