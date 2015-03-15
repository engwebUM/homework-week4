class Normal_Score
  def initialize (score)
  	@score=score
  end

  def normal_score(roll)
    @score.total += roll 
  end

end