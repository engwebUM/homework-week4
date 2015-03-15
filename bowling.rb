class Frame

  MAX_PINS = 10
  MIN_PINS = 0
  MAX_ATTEMPTS_PER_FRAME = 2

  def initialize
    @scores = Array.new(MAX_ATTEMPTS_PER_FRAME)
    @numberOfPins = MAX_PINS
    @numberOfAttempts = 0
  end

  def isStrike?
    firstAttempt == MAX_PINS
  end

  def isSpare?
    !isStrike? && score == MAX_PINS
  end

  def isDone?
    isStrike? || @numberOfAttempts == MAX_ATTEMPTS_PER_FRAME
  end

  def setScore(pins = MIN_PINS)
    if pinsDifference(pins) < MIN_PINS || pinsDifference(pins) > MAX_PINS
      raise 'Number of pins exceeded'
    end
    executeAttempt(pins)
  end

  def firstAttempt
    @scores[0].to_i
  end

  def score
    @scores[0].to_i + @scores[1].to_i
  end

  private
  def pinsDifference(pins)
    @numberOfPins - pins
  end

  def executeAttempt(pins)
    @scores[@numberOfAttempts] = pins
    @numberOfAttempts += 1
    @numberOfPins -= pins
  end
end

class Frames

  attr_reader :frameCounter, :frames

  MAX_FRAMES = 10
  MIN_FRAMES = 0
  MAX_EXTRA_BALLS = 2

  def initialize(extraBallManager = ExtraBallManager.new)
    @frameCounter = 0
    @frames = Array.new(MAX_FRAMES + MAX_EXTRA_BALLS){ Frame.new }
    @extraBallManager = extraBallManager
  end

  def setScore(pins = 0)
    getCurrentFrame.setScore(pins)
    if isBonusFrame?
      @extraBallManager.verifyExtraBallExceeded
    end
  end

  def score
    if isLastFrame? || isBonusFrame?
      calculateFramesScore(MAX_FRAMES - 2) + calculateBonusScore
    else
      calculateFramesScore(frameCounter)
    end
  end

  def getCurrentFrame
    if isLastFrame?
      @extraBallManager.calculateExtraBalls(frames[frameCounter])
    end
    getNextFrame
  end

  def isLastFrame?
    frameCounter == MAX_FRAMES - 1
  end

  def isBonusFrame?
    frameCounter >= MAX_FRAMES
  end

  private
  def calculateFramesScore(counter, score=0)
    for index in 0..counter
      score += frames[index].score + verifyIfIsStrikeOrSpare(index).to_i
    end
    score
  end

  def calculateBonusScore(score = 0)
    for index in MAX_FRAMES - 1..frameCounter
      score += frames[index].score
    end
    score
  end

  def verifyIfIsStrikeOrSpare(index)
    if frames[index].isStrike?
       closeTwoBallsScore(index + 1)
    elsif frames[index].isSpare?
      frames[index + 1].firstAttempt
    end
  end

  def closeTwoBallsScore(currentFrameNumber)
    if frames[currentFrameNumber].isStrike?
      return frames[currentFrameNumber].firstAttempt + frames[currentFrameNumber + 1].firstAttempt
    end
    frames[currentFrameNumber].score
  end

  def getNextFrame
    if frames[frameCounter].isDone?
      @frameCounter += 1
    end
    frames[frameCounter]
  end
end

class Bowling

  def initialize(frames = Frames.new)
    @frames = frames
  end

  def roll(pins = 0)
    @frames.setScore(pins)
  end

  def score
    @frames.score
  end
end

class ExtraBallManager

  def initialize
    @extraBalls = 0
  end

  def calculateExtraBalls(frame)
    if frame.isStrike?
      @extraBalls = 2
    elsif frame.isSpare?
      @extraBalls = 1
    end
  end

  def verifyExtraBallExceeded
    if emptyExtraBalls?
      raise 'All attempts exhausted - start new game'
    end
    @extraBalls -= 1
  end

  private
  def emptyExtraBalls?
    @extraBalls == 0
  end
end
