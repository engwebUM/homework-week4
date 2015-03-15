require './frame'

class Bowling

  FRAMES_MAX = 10
  attr_accessor :frames

  def initialize
    @frames = []
    @frame_current = Frame.new
    frames << @frame_current
  end

  def roll(pins)
    if(@frame_current.finish?)
      frames << @frame_current = @frame_current.nextFrame= Frame.new
    end
    @frame_current.roll(pins)
  end

  def score
    res = 0
    number_frames.times do |f|
      res+=frames[f].score
    end
    res
  end

  def gameover?
    FRAMES_MAX > frames.count
  end

  def number_frames
    if(gameover?)
      frames.count
    else
      FRAMES_MAX
    end
  end
end
