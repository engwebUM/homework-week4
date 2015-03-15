class Bowling

  attr_accessor :game

  def initialize()
    @game = Array.new
    @r = Roll.new(self)
    @s = Score.new(self)
  end 
 
  def roll(pins)
    @r.roll(pins)
  end

  def score
    @s.score
  end

end

class Roll
  attr_accessor :first_roll
  attr_accessor :second_roll
  attr_accessor :frame
  attr_accessor :valid_roll

  def initialize(bowling)
  	@bowling=bowling
  	@first_roll = -1
  	@second_roll = 0
    @frame = 0
    @valid_roll= 0
  end

  def roll(pins)
    if (@valid_roll != -1) then
      @valid_roll = 0
      frame_10_is_Strike_case(pins)
      frame_10_is_Spare_case(pins)
      frame_between_0_and_10_case(pins)
      if @valid_roll==0 then @valid_roll=-1 end
    end
  end

  @private 

  def frame_10_is_Strike_case(pins)
  	#preserved invariants: 1, 2), 3) e 4)
  	if pins<=10 and pins>=0 and @frame>=10 and @frame<12 and (@bowling.game.last=='strike' or (@bowling.game.take (@bowling.game.size-1)).last=='strike')
    then
      @valid_roll =1
      if (pins==10) then @bowling.game << 'strike' else @bowling.game << pins end
      @frame += 1
    end
  end

  def frame_10_is_Spare_case(pins)
    #preserved invariants: 1), 2), 3) e 5)
    if pins<=10 and pins>=0 and @frame==10 and @bowling.game.last=='spare'
    then
      @valid_roll =1
      if (pins==10) then @bowling.game << 'strike' else @bowling.game << pins end
      @frame += 1
    end 
  end

  def frame_between_0_and_10_case(pins)
  	#preserved invariants: 1) 2) 3)
    if pins<=10 and pins>=0 and @frame<10
    then 
      @valid_roll =1
      add_roll(pins)
    end  
  end

  # add_roll method preserve invariant 6)
  def add_roll (pins)
    first_roll_is_strike(pins)
    first_roll_is_not_strike(pins)
    second_roll_is_spare(pins)
    second_roll_is_not_spare(pins)
    # invariant 6)
    if @first_roll!=1 and @first_roll+pins>10 and !@second_roll.even? then @valid_roll = -1 end
    #second_roll increment
    if pins==10 then @second_roll += 2 else @second_roll+=1 end
  end

  def first_roll_is_strike(pins)
    if @first_roll==-1 and pins==10 and @second_roll.even?
    then
      @bowling.game << 'strike'
      @frame += 1
    end
  end

  def first_roll_is_not_strike(pins)
    if @first_roll == -1 and pins<10 and @second_roll.even?
    then 
      @bowling.game << pins
      @first_roll = pins
    end     
  end

  def second_roll_is_spare(pins)
    if @first_roll!=-1 and @first_roll+pins==10 and !@second_roll.even?
    then 
      @bowling.game << 'spare'
      @frame += 1
      @first_roll = -1
    end 
  end

  def second_roll_is_not_spare(pins)
    if @first_roll!=-1 and @first_roll+pins<10 and !@second_roll.even?
    then 
      @bowling.game << pins
      @frame += 1
      @first_roll = -1
    end 
  end

end


class Score
  def initialize(bowling)
    @bowling=bowling
  end

  def score
    position = 0
    frame = 1
    total=0
    even = 0
    @bowling.game.each do |roll|
      # invariant 7)
      if roll =='strike'
      then
        if @bowling.game[position+1]!= nil and @bowling.game[position+2]!=nil and frame<10
        then 
          total += 10 + score_aux(position+1) + score_aux(position+2)
          even=0
        else 
          total += 10
          even=0
        end 
        position += 1
        frame += 1
      end
      # invariant 8)
      if roll =='spare'
      then
        if @bowling.game[position+1]!=nil and frame<10
        then 
          total += (10-@bowling.game[position-1]) + score_aux(position+1)
          even=0
        else 
          total+=(10-@bowling.game[position-1])
          even=0
        end 
        position += 1
      end
      #non strike or spare cases
      if roll.is_a? Numeric and even==0 then total += roll; position +=1; end 
      if roll.is_a? Numeric and even==1 then total += roll; position +=1; frame+=1; even=-1 end 
      even += 1;      
    end
    total
  end

  @private 

  def score_aux (position)
    if @bowling.game[position]=='strike' then return 10 end
    if @bowling.game[position]=='spare' then return 10-score_aux(position-1) end
    if @bowling.game[position].is_a? Numeric then return @bowling.game[position] end
  end

end