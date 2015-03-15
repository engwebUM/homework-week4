# Main class of application
class Bowling
  def initialize
    @frames = Array.new(10) { Frame.new }
    @score  = Score.new(@frames)
    @current_frame = 0
  end

  def roll(pins)
    return 'Invalid Pin Value' if pins < 0 || pins > 10
    return 'Exceeded the maximum frame value' unless valid_pins_per_frame(pins)

    if @current_frame < 10
      play_roll(pins)
    else
      return 'Game already over'
    end
  end

  def play_roll(pins)
    case @current_frame
    when 0..8
      play_regular_frame(pins)
    when 9
      play_last_frame(pins)
    end
  end

  def valid_pins_per_frame(pins)
    sum_rolls_aux = @score.sum_rolls_in_frame(@current_frame) + pins
    if @current_frame < 9
      sum_rolls_aux <= 10
    else
      sum_rolls_aux <= 30
    end
  end

  def play_regular_frame(pins)
    current_roll = current_roll_index
    @frames[@current_frame].rolls[current_roll] = pins

    if @frames[@current_frame].strike?
      @frames[@current_frame].rolls[1] = '+'
      @current_frame += 1
    elsif (current_roll == 1)
      @current_frame += 1
    end
  end

  def play_last_frame(pins)
    add_extra_roll  if current_roll_index == 2
    @frames[@current_frame].rolls[current_roll_index] = pins
  end

  def add_extra_roll
    frame_aux = @frames[@current_frame]
    if frame_aux.strike? || frame_aux.spare?
      frame_aux.add_extra_roll
    else
      @current_frame += 1
    end
  end

  def current_roll_index
    current_roll_index = 0
    @frames[@current_frame].rolls.each do |roll_aux|
      if roll_aux == '-'
        break
      else
        current_roll_index += 1
      end
    end
    return current_roll_index
  end

  def score
    @score.score
    puts "|\n Final Score: " + @score.score.to_s + "\n\n"
  end

  def print
    Printer.new(@frames)
  end
end

# Class Responsable for maintain the score methods
class Score
  def initialize(frames)
    @frames = frames
    @current_frame = 0
  end

  def sum_rolls_in_frame(frame_index)
    sum_aux = 0
    @frames[frame_index].rolls.each do |roll_aux|
      sum_aux += roll_aux.to_i
    end
    return sum_aux
  end

  def score
    total_score = 0
    for @current_frame in 0 ... @frames.size - 1
      total_score += calculate_score
    end

    total_score + sum_rolls_in_frame(9)
  end

  def calculate_score
    if @frames[@current_frame].strike?
      return calculate_score_strike
    elsif @frames[@current_frame].spare? && !@frames[@current_frame].strike?
      return calculate_score_spare
    else
      return sum_rolls_in_frame(@current_frame)
    end
  end

  def calculate_score_strike(index = @current_frame)
    if (@frames[index + 1].rolls[0] == 10)
      return calculate_next_two_pins
    else
      return (@frames[index].rolls[0] + sum_rolls_in_frame(index + 1))
    end
  end

  def calculate_score_spare(frame_index = @current_frame)
    sum_rolls_in_frame(frame_index) + @frames[frame_index + 1].rolls[0].to_i
  end

  def calculate_next_two_pins(index = @current_frame)
    sum_aux = @frames[index].rolls[0] + @frames[index + 1].rolls[0]

    if (index + 1 == 9)
      return (sum_aux + @frames[index + 1].rolls[1])
    else
      return (sum_aux + @frames[index + 2].rolls[0].to_i)
    end
  end
end

# Class Responsable to print the frames
class Printer
  def initialize(frames)
    @frames = frames
    print_frames
  end

  def print_roll(frame)
    frame.rolls.each do |roll_aux|
      print ' ' + roll_aux.to_s + ' '
    end
  end

  def print_frames
    @frames.each do |frame|
      print ' |'
      print_roll(frame)
    end
  end
end

# Class that contains the rolls values for each game.
class Frame
  attr_accessor :rolls

  def initialize
    @rolls = Array.new(2, '-')
  end

  def add_extra_roll
    @rolls.push('-')
  end

  def strike?
    @rolls[0].to_i == 10
  end

  def spare?
    @rolls[0].to_i + @rolls[1].to_i == 10
  end
end

# Buggy Examples
puts "\n == Crash Avoidance Examples =="
game = Bowling.new
20.times { game.roll(6) }
game.print
game.score

game = Bowling.new
5.times { game.roll(5) }
game.print
game.score

game = Bowling.new
9.times { game.roll(10) }
game.print
game.score
# Good Examples
puts "\n == Good Examples =="
game = Bowling.new
20.times { game.roll(4) }
game.print
game.score

game = Bowling.new
21.times { game.roll(5) }
game.print
game.score

game = Bowling.new
12.times { game.roll(10) }
game.print
game.score
