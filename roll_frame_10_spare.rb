class Roll_Frame_10_Spare_Bonus

  def initialize (roll)
    @roll = roll
  end

  def add_bonus(pins)
    if (pins==10)
    then 
      @roll.game << 'strike'
    else 
      @roll.game << pins 
    end
  end 
end