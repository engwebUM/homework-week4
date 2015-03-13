class Frame

  MAX_PINS = 10
  MIN_PINS = 0
  MAX_ATTEMPTS_PER_FRAME = 2

  def initialize
    @scores = Array.new(MAX_ATTEMPTS_PER_FRAME)
    @numberOfPins = MAX_PINS
    @numberOfAttempts = 0
  end

  def isSpare?
    firstAttempt < MAX_PINS && score == MAX_PINS
  end

  def isStrike?
    firstAttempt == MAX_PINS
  end

  def isDone?
    isStrike? || @numberOfAttempts == MAX_ATTEMPTS_PER_FRAME
  end

  def setScore(pins = MIN_PINS)
    pinsDifference = @numberOfPins - pins
    if pinsDifference < MIN_PINS || pinsDifference > MAX_PINS
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

  def initialize
    @frameCounter = 0
    @frames = Array.new(MAX_FRAMES + MAX_EXTRA_BALLS){ Frame.new }
    @extraBallManager = ExtraBallManager.new(self) #injection
  end

  def setScore(pins = 0)
    getCurrentFrame.setScore(pins)
    if isBonusFrame?
      @extraBallManager.verifyExtraBallExceeded
    end
  end

  def score(bowlingScoreSystem)
    bowlingScoreSystem.score
  end

  def get(index)
    frames[index]
  end

  def isLastFrame?
    frameCounter == MAX_FRAMES - 1
  end

  def isBonusFrame?
    frameCounter >= MAX_FRAMES
  end

  private
  def getCurrentFrame
    frame = get(frameCounter)
    if frame.isDone?
      frame = getNextFrame(frame)
    end
    frame
  end

  def getNextFrame(frame)
    if isLastFrame?
      @extraBallManager.calculateExtraBalls(frame)
    end
    @frameCounter += 1
    get(frameCounter)
  end
end

class Bowling
  attr_reader :frames

  def initialize
    @frames = Frames.new
    @scoreSystem = BowlingScoreSystem.new(frames)
  end

  def roll(pins=0)
    frames.setScore(pins)
  end

  def score
    frames.score(@scoreSystem)
  end
end

class BowlingScoreSystem

  attr_reader :frames

  def initialize(frames)
    @frames = frames
  end

  def score
    if frames.frameCounter >= Frames::MAX_FRAMES - 1
      calculateFramesScore(Frames::MAX_FRAMES - 2) + calculateBonusScore
    else
      calculateFramesScore
    end
  end

  def calculateFramesScore(counter=frames.frameCounter, score=0)
    for index in 0..counter
      score += frames.get(index).score + verifyIfIsStrikeOrSpare(index).to_i
    end
    score
  end

  def calculateBonusScore(score = 0)
    for index in Frames::MAX_FRAMES - 1..frames.frameCounter
      score += frames.get(index).score
    end
    score
  end

  private
  def verifyIfIsStrikeOrSpare(index)
    if frames.get(index).isStrike?
       closeTwoBallsScore(index)
    elsif frames.get(index).isSpare?
       closeFrame(index).firstAttempt
    end
  end

  def closeFrame(currentFrameNumber)
    frames.get(currentFrameNumber + 1)
  end

  def closeTwoBallsScore(currentFrameNumber)
    closeFrame = closeFrame(currentFrameNumber)
    if closeFrame.isStrike?
       closeFrame.score + closeFrame(currentFrameNumber + 1).firstAttempt
    else
       closeFrame.score
    end
  end
end

class ExtraBallManager

  def initialize(frames)
    @frames = frames
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
    if @extraBalls == 0
      raise 'All attempts exhausted - start new game'
    end
    @extraBalls -= 1
  end
end
