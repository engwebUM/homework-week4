class Score  
  attr_accessor :rolls
  
  def initialize bowling
    @rolls = bowling.plays
  end
  
  def get_score
    pontos = 0
    index = 0
    while (index < 20 && @rolls[index]) do
	  pontos += frame_score(index)
      index += 2
    end
    pontos
  end
  
  def frame_score index
    if strike? index
      pontosStrike (index)
    elsif spare? index
      pontosSpare (index)
    elsif @rolls[index + 1]
      @rolls[index] + @rolls[index + 1]
    else
      @rolls[index]
    end
  end
  
  def strike? index
    @rolls[index] == 10
  end

  def spare? index
    if @rolls[index + 1 ]
      @rolls[index] + @rolls[index + 1] == 10
    end
  end
  
  def pontosStrike index
    10 + next_two_scores_after_strike(index)
  end
  
  def pontosSpare index
    10 + next_score(index)
  end
  
  def next_score index
	if @rolls[index + 1]
      @rolls[index + 1]
    else
      0
	end
  end
  
  def next_score_after_strike index
	if @rolls[index + 2]
      @rolls[index + 2]
    else
      0
	end
  end
  
  def next_two_scores_after_strike index
    if strike? (index + 2)
		next_score_after_strike(index) + next_score_after_strike(index + 2)
	else
		next_score_after_strike(index) + next_score(index + 2)
    end
  end 
end