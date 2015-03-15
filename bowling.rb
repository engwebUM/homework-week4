load 'roll.rb'
load 'score.rb'

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


a=[1,2,3,4,5]
p a[a.size-1]