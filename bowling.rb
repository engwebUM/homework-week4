require_relative './bowling_error'
require_relative './bowling_roll'
require_relative './bowling_score'
class Bowling 
  def initialize 
  	@score=Array.new(10) { Hash.new }
    @gamescore=Array.new

    @berror= Bowling_error.new

  end


  def roll(pins)
   @berror.isnumeric(pins)    
   @berror.numberpins(pins)
   @broll= Bowling_roll.new(@score,@berror)
   @broll.roll(pins)

  end


  def score

    @bscore= Bowling_score.new(@score,@gamescore)
    @bscore.score
    return @gamescore.inject{|sum,x| sum + x }
  end

end







