class Bowling
  def initialize
  	@rolls = Array.new(21){0} 
    @index = 0
    @score = 0
    @roll_index = 0
  end

  def roll(pins)
    @rolls[ @index ] = pins
    @index += 1
    self
  end

  def score
    (1..10).each do
      calculate_score @roll_index
    end
    @score
  end

  def is_strike? roll_index
    @rolls[roll_index] == 10
  end

  def is_spare? roll_index
    @rolls[roll_index] + @rolls[roll_index + 1] == 10
  end

  def roll_strike roll_index
    10 + @rolls[roll_index + 1] + @rolls[roll_index + 2]
  end

  def roll_spare roll_index
    10 + @rolls[roll_index + 2]
  end

  def bonus_strike roll_index
    @score += roll_strike(roll_index)
    @roll_index += 1
  end

  def bonus_spare roll_index
    @score += roll_spare(@roll_index)
    @roll_index += 2
  end

  def normal_count roll_index
    @score += roll_pins_frame(@roll_index)
    @roll_index += 2
  end

  def calculate_score roll_index
    if is_strike? roll_index
      bonus_strike(roll_index)
    elsif is_spare? roll_index
      bonus_spare(roll_index)
    else
      normal_count(roll_index)
    end
  end

  def roll_pins_frame roll_index
    @rolls[roll_index] + @rolls[roll_index + 1]
  end
end
