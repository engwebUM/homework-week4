class Bowling
  attr_reader :rolls

  def initialize
    @rolls = Array.new(21)
  end

  def roll(pins)
    fail 'game over' if game_over?
    fail 'impossible play' if pins < 0 || pins > pins_standing

    rolls[playing_roll] = pins
    if strike_on_regular_frame? || neither_strike_nor_spare_on_last_frame?
      rolls[playing_roll] = 0   # then next ball is set from nil to 0
    end
  end

  def score
    points = 0
    (0..9).each do |frame|
      if strike?(frame)
        points += 10 + bonus_strike(frame)
      elsif spare?(frame)
        points += 10 + bonus_spare(frame)
      else
        points += frame_points(frame)
      end
    end
    points
  end

  private

  def bonus_spare(frame)
    rolls[2 * frame + 2].to_i
  end

  def bonus_strike(frame)
    if frame < 9
      rolls[2 * frame + 2].to_i + if strike?(frame + 1)
                                    rolls[2 * frame + 4].to_i
                                  else
                                    rolls[2 * frame + 3].to_i
                                  end
    else  # tenth frame
      rolls[2 * frame + 1].to_i + rolls[2 * frame + 2].to_i
    end
  end

  def frame_points(frame)
    rolls[2 * frame].to_i + rolls[2 * frame + 1].to_i
  end

  def game_over?
    rolls.find_index(nil).nil?
  end

  def neither_strike_nor_spare_on_last_frame?
    (playing_roll > 19) && !(strike?(9) || spare?(9))
  end

  def pins_standing
    if playing_roll <= 18
      playing_roll.even? ? pins = 10 : pins = 10 - rolls[playing_roll - 1]
    else  # tenth frame
      if spare?(9) # 10 pins on 3rd ball if tenth frame was a spare
        pins = 10
      else # 2nd and (eventual) 3rd balls both follow this rule in other occasions
        rolls[playing_roll - 1] == 10 ? pins = 10 : pins = 10 - rolls[playing_roll - 1]
      end
    end
    pins
  end

  def playing_roll
    rolls.find_index(nil).to_i
  end

  def spare?(frame)
    !strike?(frame) && (rolls[2 * frame].to_i + rolls[2 * frame + 1].to_i == 10)
  end

  def strike?(frame)
    rolls[2 * frame].to_i == 10
  end

  def strike_on_regular_frame?
    (playing_roll < 18) && strike?(playing_roll / 2) && (!game_over?)
  end
end
