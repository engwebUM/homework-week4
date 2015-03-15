class Frame

  PINS_MAX = 10
  ROLLS_MAX = 2

  attr_accessor :rolls, :nextFrame

  def initialize
    @rolls = []
  end

  def roll(pins)
    if(pins>=0 && pins<=PINS_MAX)
      rolls << pins
    else
      raise "ErroPins"
    end
  end

  def score
    if strike?
      result + strikeBonus
    elsif spare?
      result + spareBonus
    elsif(errorScore?)
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

  def strikeBonus
    if nextFrame.finish?
      if nextFrame.strike?
        PINS_MAX+nextFrame.spareBonus
      else
        nextFrame.result
      end
    end
  end

  def spare?
    result == PINS_MAX
  end

  def spareBonus
    nextFrame.rolls.first
  end

  def finish?
    strike? || rolls.count == ROLLS_MAX
  end

  def nextFrame=(frame)
    @nextFrame = frame
  end

  def errorScore?
    result > PINS_MAX
  end
end
