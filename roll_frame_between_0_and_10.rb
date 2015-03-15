class Roll_Frame_Between_0_and_10

  def initialize(roll)
    @roll = roll
  end

  def add_roll(pins)
    first_roll_is_strike(pins)
    first_roll_is_not_strike(pins)
    second_roll_is_spare(pins)
    second_roll_is_not_spare(pins)
    invalid_roll(pins)
    second_roll_increment(pins)
  end

  @private 

  def first_roll_is_strike(pins)
    if @roll.first_roll==-1 and pins==10 and @roll.second_roll.even?
    then
      @roll.game << 'strike'
      @roll.frame += 1
    end
  end

  def first_roll_is_not_strike(pins)
    if @roll.first_roll == -1 and pins<10 and @roll.second_roll.even?
    then 
      @roll.game << pins
      @roll.first_roll = pins
    end     
  end

  def second_roll_is_spare(pins)
    if @roll.first_roll!=-1 and @roll.first_roll+pins==10 and !@roll.second_roll.even?
    then 
      @roll.game << 'spare'
      @roll.frame += 1
      @roll.first_roll = -1
    end 
  end

  def second_roll_is_not_spare(pins)
    if @roll.first_roll!=-1 and @roll.first_roll+pins<10 and !@roll.second_roll.even?
    then 
      @roll.game << pins
      @roll.frame += 1
      @roll.first_roll = -1
    end 
  end

  def invalid_roll(pins)
    if @roll.first_roll!=1 and @roll.first_roll+pins>10 and !@roll.second_roll.even? 
    then 
      @roll.valid_roll = -1 
    end
  end

  def second_roll_increment(pins)
    if pins==10 
    then 
      @roll.second_roll += 2 
    else 
      @roll.second_roll+=1 
    end
  end

end