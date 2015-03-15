load 'strike_score.rb'
load 'spare_score.rb'
load 'normal_score.rb'


class Score

  attr_accessor :game 
  attr_accessor :total
  attr_accessor :position
  attr_accessor :frame
  attr_accessor :is_valid

  def initialize(bowling)
    @bowling=bowling
    @game=bowling.game
    @position=0      #Array position
    @total=0         #total score
    @frame = 1       #frame number
    @is_valid = 0    #is a valid count??  (if no then -1) 
  end

  def score_verification
    @bowling.game.each do |roll|
      is_strike?(roll)
      is_spare?(roll)
      is_normal_point_score?(roll)
      invalid_score(roll)
      @is_valid += 1;
    end
    @total
  end

  @private 

  def is_strike?(roll)
    if roll =='strike'
    then
      add_strike_score = Strike_Score.new(self)
      add_strike_score.strike_score
      @position += 1
      @frame += 1
    end
  end

  def is_spare?(roll)
    if roll =='spare'
    then
      add_spare_score = Spare_Score.new(self)
      add_spare_score.spare_score
      @position += 1
    end
  end

  def is_normal_point_score?(roll)
    if roll.is_a? Numeric and @is_valid==0 
    then 
      add_normal_score = Normal_Score.new(self)
      add_normal_score.normal_score(roll)
      @position +=1 
    end 
  end

  def invalid_score(roll)
    if roll.is_a? Numeric and @is_valid==1 
    then 
      @total += roll
      @position +=1
      @frame+=1
      @is_valid=-1 
    end 
  end

end