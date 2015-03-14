class Bowling
  def initialize
  	# array with length 21 beacuse in each game is only possible roll 21 times
  	@rolls = Array.new(21){0} 
  	# initialize in position 0 of array
    @index = 0
  end

  def roll(pins)
  	# in each roll the number of pins drop is saved in array
    @rolls[ @index ] = pins
    # the position in array is incremented with 1 value
    @index += 1
    # allow multi rolls (method can be chained), is util for test complete game
    self
  end

  # return the value of score game
  def score
    score = 0
    roll_index = 0
    # 1 until 10 because is the max number of frames in a game
    (1..10).each do
      if is_strike? roll_index
        score += roll_strike(roll_index)
        # for the strike we need only the first roll per frame
        roll_index += 1
      elsif is_spare? roll_index
          score += roll_spare(roll_index)
          # for the spare we need a two rolls per frame
          roll_index += 2
      else
      	score += roll_pins_frame(roll_index)
      	# for the normal rolls without spare or strike we need a two rolls per frame
        roll_index += 2
      end
    end
  score
  end

  # check if was strike, only in the first roll of frame is necessary drop all pins (10), return true or false
  def is_strike? roll_index
    @rolls[roll_index] == 10
  end

  # check if was spare, we need two rolls and the sum of the two should be 10, return true or false
  def is_spare? roll_index
    @rolls[roll_index] + @rolls[roll_index + 1] == 10
  end

  # calculate the pontuation for strike, 10 plus next two rolls
  def roll_strike roll_index
    10 + @rolls[roll_index + 1] + @rolls[roll_index + 2]
  end

  #calculate the pontuation for spare, 10 plus next roll
  def roll_spare roll_index
    10 + @rolls[roll_index + 2]
  end

  # calculate the pontuation for two normal rolls, without spare or strike
  def roll_pins_frame roll_index
    @rolls[roll_index] + @rolls[roll_index + 1]
  end
end
