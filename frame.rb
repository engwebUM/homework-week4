class Frame

  PINS_MAX = 10
  ROLLS_MAX = 2

  attr_accessor :rolls, :next_frame

  def initialize
    @rolls = []
  end

  def roll(pins)
    if(pins >= 0 && pins <= PINS_MAX)
      rolls << pins
    else
      raise "ErroPins"
    end
  end

  def score
    if(strike?)
      result + strike_bonus
    elsif(spare?)
      result + spare_bonus
    elsif(error_score?)
      raise "ErroScore"
    else
      result
    end
  end

  def result
    rolls.inject(:+)
  end

  def strike?
    rolls.first == PINS_MAX
  end

  def strike_bonus
    if(next_frame.finish?)
      if(next_frame.strike?)
        PINS_MAX + next_frame.spare_bonus
      else
        next_frame.result
      end
    end
  end

  def spare?
    result == PINS_MAX
  end

  def spare_bonus
    next_frame.rolls.first
  end

  def finish?
    strike? || rolls.count == ROLLS_MAX
  end

  def next_frame=(frame)
    @next_frame = frame
  end

  def error_score?
    result > PINS_MAX
  end
end
