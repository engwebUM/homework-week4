class Bowling
  attr_reader :frames

  def initialize
    @frames = Array.new(9) { Frame.new }
    @frames << LastFrame.new
  end

  def roll(pins)
    fail 'game over' if game_over?
    fail 'impossible play' if pins < 0 || pins > pins_standing

    playing_frame.roll(pins)
    return if game_over?
    if strike_on_regular_frame? || neither_strike_nor_spare_on_last_frame?
      playing_frame.roll(0)
    end
  end

  def score
    points = 0
    frames.each_with_index { |frame, index|
      points += frame.points
      if frame.strike? && index < 9
        points += bonus_strike(index)
      elsif frame.spare? && index < 9
        points += bonus_spare(index)
      end }
    points
  end

  private

  def bonus_spare(index)
    frames[index + 1].first
  end

  def bonus_strike(index)
    bonus_spare(index) + if frames[index + 1].strike? && index < 8
                           frames[index + 2].first
                         else
                           frames[index + 1].second
                         end
  end

  def game_over?
    frames.each { |frame|
      if !frame.over?
        return false
      end }
    return true
  end

  def pins_standing
    playing_frame.pins_standing
  end

  def playing_frame
    frames.each { |frame|
      if !frame.over?
        return frame
      end }
    return nil
  end

  def strike_on_regular_frame?
    if frames.find_index(playing_frame) < 9
      playing_frame.nil? ? false : playing_frame.strike?
    end
  end

  def neither_strike_nor_spare_on_last_frame?
    playing_frame.playing_roll == 2 && !(playing_frame.strike? || playing_frame.spare?)
  end
end

class Frame
  attr_reader :rolls

  def initialize
    @rolls = [nil, nil]
  end

  def roll(pins)
    @rolls[playing_roll] = pins
  end

  def over?
    rolls.find_index(nil).nil?
  end

  def playing_roll
    rolls.find_index(nil)
  end

  def first
    rolls[0].to_i
  end

  def second
    rolls[1].to_i
  end

  def points
    first + second
  end

  def pins_standing
    playing_roll == 0 ? 10 : 10 - first
  end

  def spare?
    !strike? && (first + second == 10)
  end

  def strike?
    first == 10
  end
end

class LastFrame < Frame
  def initialize
    @rolls = [nil, nil, nil]
  end

  def third
    rolls[2].to_i
  end

  def points
    first + second + third
  end

  def pins_standing
    if playing_roll == 0 || spare?
      10
    else
      rolls[playing_roll - 1] == 10 ? 10 : 10 - rolls[playing_roll - 1]
    end
  end
end
