class Bowling
  attr_reader :frames, :current_frame, :count_frames
  def initialize
    @frames = Array.new(10) {[0,0]}
    @current_frame = []
    @count_frames = 0
  end

  def roll(pins)
    if pins == 10 && @current_frame.length == 0
      add_strike(pins)
    else
      add_pins_frame(pins)
    end
  end

  def score
    score = 0
    aux_current_frame = []
    @frames.each_index do |index|
      aux_current_frame = @frames[index]
      if is_strike(aux_current_frame)
        score += strike(index)

      elsif aux_current_frame.length== 2 && is_spare(aux_current_frame)
        score += spare(index)
      else
        score += calculating_score(aux_current_frame)
      end
    end

    return score
  end

  def add_strike(pins)
      @current_frame.push(pins)
      @current_frame.push(0)
      @frames[@count_frames]= @current_frame
      @count_frames += 1
      @current_frame = []
  end

  def add_pins_frame(pins)
    if @current_frame.length == 1 && @count_frames != 9
      end_frame(pins)
    else
      add_pins(pins)
    end
  end

  def end_frame(pins)
    @current_frame.push(pins)
    @frames[@count_frames] = @current_frame
    @current_frame = []
    @count_frames += 1
  end

  def add_pins(pins)
    @current_frame.push(pins)
    @frames[@count_frames]= @current_frame
  end


  def is_strike(strike)
    strike[0] == 10
  end

  def is_spare(spare)
    spare[0] + spare[1] == 10
  end

  def calculating_score(aux_current_frame)
    score = 0
    aux_current_frame.each do |x|
      score += x
    end
    return score
  end

  def strike (frame_index)
    strike = @frames[frame_index + 1]
    return 10 + strike[0] + strike[1]
  end

  def spare (frame_index)
    spare = @frames[frame_index + 1]
    return 10 + spare[0]
  end
end
