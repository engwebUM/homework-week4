class Bowling
  def initialize(bowling_session)
    @score = 0
    @bonus = [0, 0]
    @session = bowling_session
    @session.add_observer(self)
  end

  def roll(pins)
    if !@session.finished?
      @score += pins * (1 + bonus)
      @session.roll(pins)
    end
  end

  def score
    @score
  end

  def update(event)
    case event
    when :strike
      add_bonus(2)
    when :spare
      add_bonus(1)
    end
  end

  private

  def add_bonus(amount)
    if !@session.last_frame?
      for i in 0..amount - 1
        @bonus[i] += 1
      end
    end
  end

  def bonus
    @bonus.push(0)
    @bonus.shift    
  end
end

class BowlingSession
  def initialize(observers)
    @observers = observers
    @current_frame = 1
    @current_frame_score = nil
    @last_frame_throws = 0
    @last_frame_throws_limit = 2
  end

  def roll(pins)
    if @current_frame == 10
      @last_frame_throws += 1
    end

    type = :regular

    case
    when @current_frame_score != nil && @current_frame_score + pins == 10
      type = :spare
    when @current_frame_score == nil && pins == 10
      type = :strike
    end

    throw_handler(type, pins)
  end

  def finished?
    @last_frame_throws == @last_frame_throws_limit
  end

  def last_frame?
    @current_frame == 10
  end

  def add_observer(observer)
    @observers.push(observer)
  end

  private

  def throw_handler(type, pins)
    notify(type)

    if @current_frame < 10 && ([:strike, :spare].include?(type) || @current_frame_score != nil)
      advance_frame
    else
      @current_frame_score = pins
    end

    if @current_frame == 10 && [:strike, :spare].include?(type)
      @last_frame_throws_limit = 3
    end
  end

  def advance_frame
    @current_frame_score = nil
    @current_frame += 1
  end

  def notify(event)
    @observers.each { |o| o.update(event) }
  end
end
