class Bowling

  attr_reader :currently_roll_number, :rolls

  def initialize
    @rolls = Array.new(21, 0)
    @currently_roll_number = 0
  end

  def roll(pins)
    roll_type(pins)
    @currently_roll_number += 1
  end

  def roll_type(pins)
    if(@currently_roll_number < 18)
      normal_roll(pins)
    elsif (@currently_roll_number == 18)
      roll18(pins)
    elsif (@currently_roll_number == 19)
      roll19(pins)
    elsif (@currently_roll_number == 20)
      roll20(pins)
    else
      raise "No rolls left"
    end
  end

  def normal_roll(pins)
    if (@currently_roll_number.odd?)
      odd_frame(pins)
    else
      even_frame(pins)
    end
  end

  def roll18(pins)
    verify_strike_or_spare_bonus(pins)
    @rolls[@currently_roll_number] = pins
  end

  def roll19(pins)
    verify_strike_bonus_frame19(pins)
    @rolls[@currently_roll_number] = pins
    if ((pins+@rolls[@currently_roll_number-1])<10)
      @rolls[@currently_roll_number] = pins
    elsif ((pins+@rolls[@currently_roll_number-1]) == 10)
      @rolls[@currently_roll_number-1] = 10
      @rolls[@currently_roll_number] = "/"
    end
  end

  def roll20(pins)
    if (@rolls[@currently_roll_number-1] == "/" || @rolls[@currently_roll_number-1] == 10 || @rolls[@currently_roll_number-2] == 10)
      @rolls[@currently_roll_number] += pins
    else
      raise "You didn't spared/striked before, you can't play the 3rd ball"
    end
  end

  def odd_frame(pins)
    verify_strike_bonus(pins)
    verify_strike_bonus2(pins)
    second_try(pins)
  end

  def even_frame(pins)
    verify_strike_or_spare_bonus(pins)
    verify_strike_bonus3(pins)
    first_try(pins)
  end

  def first_try(pins)
    if (pins == 10)
      strike_case
      @currently_roll_number += 1
    else
      normal_case(pins)
    end
  end

  def second_try(pins)
    if ((pins+@rolls[@currently_roll_number-1])<10)
      normal_case(pins)
    else
      spare_case
    end
  end

  def strike_case
    @rolls[@currently_roll_number] = 10
    @rolls[@currently_roll_number+1] = "X"
  end

  def normal_case(pins)
    @rolls[@currently_roll_number] = pins
  end

  def spare_case
    @rolls[@currently_roll_number-1] = 10
    @rolls[@currently_roll_number] = "/"
  end

  def verify_strike_bonus(pins)
    if(@rolls[@currently_roll_number-2] == "X")
      @rolls[@currently_roll_number-3] += pins
    end
  end

  def verify_strike_bonus2(pins)
    if(@rolls[@currently_roll_number-2] == "X" && @rolls[@currently_roll_number-4] == "X")
      @rolls[@currently_roll_number-5] += pins
    end
  end

  def verify_strike_bonus3(pins)
    if(@rolls[@currently_roll_number-1] == "X" && @rolls[@currently_roll_number-3] == "X")
      @rolls[@currently_roll_number-4] += pins
    end
  end

  def verify_strike_or_spare_bonus(pins)
    if(@rolls[@currently_roll_number-1] == "/" || @rolls[@currently_roll_number-1] == "X")
      @rolls[@currently_roll_number-2] += pins
    end
  end

  def verify_strike_bonus_frame19(pins)
    if(@rolls[@currently_roll_number-2] == "X")
      @rolls[@currently_roll_number-5] += pins
    end
    if(@rolls[18] == 10 && @rolls[@currently_roll_number-2] == "X")
      @rolls[@currently_roll_number-3] += pins
    end
  end
end


class Score
  def initialize(score)
    @score = score
  end

  def total_score
    $score = 0
    for i in 0...@score.length
      $score += roll_score(i)
    end
    return $score
  end

  private

  def roll_score(iteration)
    $roll_score = @score[iteration]
    if($roll_score == "X" || $roll_score == "/")
      $roll_score = 0
    end
    return $roll_score
  end
end
