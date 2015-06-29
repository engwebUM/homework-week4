class Frame

  attr_accessor :bonusScore

  def initialize
    @firstRoll = 0
    @secondRoll = 0
    @bonusScore = 0
    @roll = 0  
  end

  def roll(pins)
    if (@roll == 0)
      @firstRoll = pins
    else (@roll == 1)
      @secondRoll = pins
    end

    @roll = @roll+1
  end

  def isLast
    if (@roll >= 2 || @firstRoll == 10)
      return true
    else 
      return
    end
  end

  def score 
    score = @firstRoll + @secondRoll + @bonusScore
    return score
  end 
end

class Bowling

  def initialize
    @frames  = []
    @spare = false
    @strike  = false
  end

  def previousFrame(position)
    return @frames[position] 
  end

  def roll(pins)
    frame = currentFrame
    frame.roll(pins)
    verifications(pins, frame)
  end

  def currentFrame
    if (@frames.empty? || @frames.last.isLast) 
      @frames << Frame.new  
    end
    return @frames.last
  end

  def verifications(pins, frame)
    
    if (@strike && frame.isLast)  
     previousFrame.bonusScore = frame.score
     @strike = false 
    end

    if (pins == 10) 
      @strike = true
    end
    
    if (@spare)         
      previousFrame(-2).bonusScore = pins
      @spare = false 
    end
    
    if (frame.score == 10) 
      @spare = true 
    end
  end

  def totalScore
    totalScore = 0
    @frames.each do |frame| 
      totalScore = totalScore + frame.score
    end
    return totalScore
  end
end
