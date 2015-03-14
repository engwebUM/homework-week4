require_relative 'frame'

class Bowling

  def initialize
    @frames  = Array.new()
    @is_spare = false
    @is_Strike  = false
  end

  def roll(pins)
    # roll the desired number of pins
    frame = current_frame
    frame.roll(pins)
    verify_strike(pins, frame)
    verify_spare(pins, frame)
  end

  def current_frame
    if (@frames.empty? || @frames.last.verify_end==true) 
      @frames << Frame.new 
    end
    return @frames.last 
  end

  def previous_frame(position)
        return @frames[position] 
  end

  def verify_strike(pins, frame)
    if (@is_strike==true && frame.verify_end==true) 
     previous_frame(-2).bonus = frame.score 
     @is_strike = false
    end

    if (pins == 10) 
      @is_strike = true 
    end
  end

  def verify_spare(pins, frame)
    if (@is_spare == true)  
      previous_frame(-2).bonus = pins 
      @is_spare = false
    end
    
    if (frame.score == 10)
      @is_spare = true
    end  
  end

  def score
    # return the current score
    current_score = 0
    @frames.each do |frame| 
      current_score = current_score + frame.score
    end
    return current_score
  end
end