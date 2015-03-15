class Bowling

  attr_reader :currentlyRollNumber, :rolls

  def initialize
    @rolls = Array.new(21, 0)
    @currentlyRollNumber = 0
  end

  def strikeCase
    @rolls[@currentlyRollNumber] = 10
    @rolls[@currentlyRollNumber+1] = "X"
    @currentlyRollNumber += 2
  end

  def normalCase(pins)
    @rolls[@currentlyRollNumber] = pins
    @currentlyRollNumber += 1
  end

  def spareCase
    @rolls[@currentlyRollNumber-1] = 10
    @rolls[@currentlyRollNumber] = "/"
    @currentlyRollNumber += 1
  end

  def firstTry(pins)
    if (pins == 10)
      strikeCase
    else
      normalCase(pins)
    end
  end

  def secondTry(pins)
    if ((pins+@rolls[@currentlyRollNumber-1])<10)
      normalCase(pins)
    else
      spareCase
    end
  end

  def verifyStrikeBonus(pins)
    if(@rolls[@currentlyRollNumber-2] == "X")
      @rolls[@currentlyRollNumber-3] += pins
    end
  end

  def verifyStrikeBonus2(pins)
    if(@rolls[@currentlyRollNumber-2] == "X" && @rolls[@currentlyRollNumber-4] == "X")
      @rolls[@currentlyRollNumber-5] += pins
    end
  end

  def verifyStrikeBonus3(pins)
    if(@rolls[@currentlyRollNumber-1] == "X" && @rolls[@currentlyRollNumber-3] == "X")
      @rolls[@currentlyRollNumber-4] += pins
    end
  end

  def verifyStrikeOrSpareBonus(pins)
    if(@rolls[@currentlyRollNumber-1] == "/" || @rolls[@currentlyRollNumber-1] == "X")
      @rolls[@currentlyRollNumber-2] += pins
    end
  end

  def verifyStrikeBonusFrame19(pins)
    if(@rolls[@currentlyRollNumber-2] == "X")
      @rolls[@currentlyRollNumber-5] += pins
    end
    if(@rolls[18] == 10 && @rolls[@currentlyRollNumber-2] == "X")
      @rolls[@currentlyRollNumber-3] += pins
    end
  end

  def frameType(pins)
    if(@currentlyRollNumber < 18)
      normalRoll(pins)
    elsif (@currentlyRollNumber == 18)
      frame18(pins)
    elsif (@currentlyRollNumber == 19)
      frame19(pins)
    elsif (@currentlyRollNumber == 20)
      frame20(pins)
    else
      raise "No rolls left"
    end
  end

  def normalRoll(pins)
    if (@currentlyRollNumber.odd?)
      oddFrame(pins)
    else
      evenFrame(pins)
    end
  end

  def oddFrame(pins)
    verifyStrikeBonus(pins)
    verifyStrikeBonus2(pins)
    secondTry(pins)
  end

  def evenFrame(pins)
    verifyStrikeOrSpareBonus(pins)
    verifyStrikeBonus3(pins)
    firstTry(pins)
  end

  def frame18(pins)
    verifyStrikeOrSpareBonus(pins)
    @rolls[@currentlyRollNumber] = pins
    @currentlyRollNumber += 1
  end

  def frame19(pins)
    verifyStrikeBonusFrame19(pins)
    @rolls[@currentlyRollNumber] = pins
    if ((pins+@rolls[@currentlyRollNumber-1])<10)
      @rolls[@currentlyRollNumber] = pins
    elsif ((pins+@rolls[@currentlyRollNumber-1]) == 10)
      @rolls[@currentlyRollNumber-1] = 10
      @rolls[@currentlyRollNumber] = "/"
    end
    @currentlyRollNumber += 1
  end

  def frame20(pins)
    if (@rolls[@currentlyRollNumber-1] == "/" || @rolls[@currentlyRollNumber-1] == 10 || @rolls[@currentlyRollNumber-2] == 10)
      @rolls[@currentlyRollNumber] += pins
      @currentlyRollNumber += 1
    else
      raise "You didn't spared/striked before, you can't play the 3rd ball"
    end
  end


  def roll(pins)
    frameType(pins)
  end

  def score
    $score = 0
    for i in 0...21
      $score += rollScore(i)
    end
    return $score
  end

  def rollScore(iteration)
    $frame_score = @rolls[iteration]
    if($frame_score == "X" || $frame_score == "/")
      $frame_score = 0
    end
    return $frame_score
  end
end
