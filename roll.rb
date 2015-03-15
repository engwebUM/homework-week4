load 'roll_frame_10_strike.rb'
load 'roll_frame_10_spare.rb'
load 'roll_frame_between_0_and_10.rb'


class Roll
  attr_accessor :bowling 
  attr_accessor :game
  attr_accessor :first_roll    
  attr_accessor :second_roll   
  attr_accessor :frame         # number of frames
  attr_accessor :valid_roll    #is a valid roll ??  (if no then -1) 

  def initialize(bowling)
  	@bowling=bowling
    @game = bowling.game
  	@first_roll = -1
  	@second_roll = 0
    @frame = 0
    @valid_roll= 0
  end

  def roll(pins)
    if (@valid_roll != -1) 
    then
      @valid_roll = 0
      frame_10_is_Strike_case(pins)
      frame_10_is_Spare_case(pins)
      frame_between_0_and_10_case(pins)
      is_valid_roll?
    end
  end

  @private 

  def frame_10_is_Strike_case(pins)
  	if pins<=10 and pins>=0 and @frame>=10 and @frame<12 and (@game.last=='strike' or (@game.take(@game.size-1)).last=='strike')
    then
      @valid_roll =1
      frame_10_strike_bonus = Roll_Frame_10_Strike_Bonus.new(self)
      frame_10_strike_bonus.add_bonus(pins)
      @frame += 1
    end
  end

  def frame_10_is_Spare_case(pins)
    if pins<=10 and pins>=0 and @frame==10 and @game.last=='spare'
    then
      @valid_roll =1
      frame_10_spare_bonus = Roll_Frame_10_Spare_Bonus.new(self)
      frame_10_spare_bonus.add_bonus(pins)
      @frame += 1
    end 
  end

  def frame_between_0_and_10_case(pins)
    if pins<=10 and pins>=0 and @frame<10
    then 
      @valid_roll =1
      frame_between_0_and_10 = Roll_Frame_Between_0_and_10.new(self)
      frame_between_0_and_10.add_roll(pins)
    end  
  end

  def is_valid_roll?
    if @valid_roll==0 then @valid_roll=-1 end
  end

end