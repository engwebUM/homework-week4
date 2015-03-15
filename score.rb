class Score

  def initialize(bowling)
    @bowling=bowling
    @position=0      #Array position
    @total=0         #total score
    @frame = 1       #frame number
    @is_valid = 0    #is a valid count??  (if no then -1) 
  end

  def score
    @bowling.game.each do |roll|
      is_strike?(roll)
      is_spare?(roll)
      normal_point_score(roll)
      invalid_score(roll)
      @is_valid += 1;
    end
    @total
  end

  @private 

  def string_to_score (position)
    if @bowling.game[position]=='strike' then return 10 end
    if @bowling.game[position]=='spare' then return 10-string_to_score(position-1) end
    if @bowling.game[position].is_a? Numeric then return @bowling.game[position] end
  end

  def is_strike?(roll)
    if roll =='strike'
    then
      strike_score
      @position += 1
      @frame += 1
    end
  end

  def strike_score 
    if @bowling.game[@position+1]!= nil and @bowling.game[@position+2]!=nil and @frame<10
    then 
      @total += 10 + string_to_score(@position+1) + string_to_score(@position+2)
      @is_valid=0
    else 
      @total += 10
      @is_valid=0
    end 
  end

  def is_spare?(roll)
    if roll =='spare'
    then
      spare_score
      @position += 1
    end
  end

  def spare_score
    if @bowling.game[@position+1]!=nil and @frame<10
    then 
      @total += (10-@bowling.game[@position-1]) + string_to_score(@position+1)
      @is_valid=0
    else 
      @total+=(10-@bowling.game[@position-1])
      @is_valid=0
    end 
  end

  def normal_point_score(roll)
    if roll.is_a? Numeric and @is_valid==0 
    then 
      @total += roll 
      @position +=1 
    end 
  end

  def invalid_score(roll)
    if roll.is_a? Numeric and @is_valid==1 
    then 
      @total += roll
      @position +=1
      @frame+=1
      @is_valid=-1 
    end 
  end

end