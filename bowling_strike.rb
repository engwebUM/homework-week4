class Bowling_strike

  def Strike(i,score,gamescore)
    if i<8
     gamescore=firsteightround(i,score,gamescore)

    elsif i==8 && score[i+1][0]!=nil && score[i+1][1]!=nil
      gamescore<<score[i+1][0]+score[i+1][1]+10
        
    elsif score[i][0]!=nil && score[i][1]!=nil && score[i][2]!=nil && i==9
        gamescore<<score[9][0]+score[9][1]+score[9][2]
    end
  end


  def firsteightround(i,score,gamescore)
    if score[i+1][0]!=nil && score[i+1][1]!=nil
       gamescore<<score[i+1][0]+score[i+1][1]+10

    elsif score[i+1][0]!=nil && score[i+2][0]!=nil
       gamescore<<score[i+1][0]+score[i+2][0]+10
    end
  end

end