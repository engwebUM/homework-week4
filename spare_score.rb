class Spare_Score
  def initialize (score)
  	@score=score
  end

  def spare_score
    if @score.game[@score.position+1]!=nil and @score.frame<10
    then 
      @score.total += (10-@score.game[@score.position-1]) + string_to_score(@score.position+1)
      @score.is_valid=0
    else 
      @score.total+=(10-@score.game[@score.position-1])
      @score.is_valid=0
    end 
  end

  @private 

  def string_to_score(position)
    total=0
    total+= string_is_strike? (position)
    total+= string_is_spare? (position)
    total+= string_is_a_number(position)
    total
  end

  def string_is_strike?(position)
    total=0
    if @score.game[position]=='strike' 
    then 
      total= 10 
    end
    total
  end

  def string_is_spare?(position)
    total=0
    if @score.game[position]=='spare' 
    then 
      total= 10-string_to_score(position-1)
    end
    total
  end

  def string_is_a_number(position)
    total=0
    if @score.game[position].is_a? Numeric
    then 
      total= @score.game[position] 
    end
    total
  end

end