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

  def string_to_score (position)
    if @score.game[position]=='strike' then return 10 end
    if @score.game[position]=='spare' then return 10-string_to_score(position-1) end
    if @score.game[position].is_a? Numeric then return @score.game[position] end
  end

end