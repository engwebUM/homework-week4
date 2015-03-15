load 'roll.rb'
load 'score.rb'

class Bowling
  attr_accessor :plays

  def initialize ()
    @plays = Array.new
    @rolls = Roll.new(self)
    @scores = Score.new(self)
  end
    
  def roll (pins)
	@rolls.roll_add pins
  end
  
  def score
	@scores.get_score
  end
  
end

  