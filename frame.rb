class Frame

  attr_accessor :bonus

  def initialize
    @first_roll = 0
    @second_roll = 0
    @bonus = 0
    @counter_roll = 0  
  end

  def roll(pins)
    if (@counter_roll == 0)
      @first_roll = pins
    else (@counter_roll == 1)
      @second_roll  = pins
    end
    @counter_roll = @counter_roll + 1
  end

  def verify_end
    if (@counter_roll >= 2 || @first_roll == 10)
      return true
    else return false
    end
  end

  def score 
    return @first_roll + @second_roll + @bonus
  end 
end

