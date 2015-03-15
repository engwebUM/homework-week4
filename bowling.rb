require './frame'

class Bowling

  FRAMES_MAX = 10
  attr_accessor :frames, :frame_current


  def initialize
    @frames = []
    @frame_current = Frame.new
    frames << frame_current
  end

  def roll(pins)
    if(frame_current.finish?)
      frames << @frame_current = frame_current.next_frame = Frame.new
    end
    frame_current.roll(pins)
  end

  def score
    result = 0
    number_frames.times do |index|
      result += frames[index].score
    end
    result
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
