class Bowling

  FRAME_MAX = 10
  PINS_MAX = 10


  def initialize
    @rolls = []
  end

  def roll(pins)
    # roll the desired number of pins
    if(pins>=0 && pins<=PINS_MAX)
      @rolls << pins
    else
      raise "ErroPins"
    end
  end

  def score
    # return the current score
    res = count = frame = 0
    err = false
    while (frame < FRAME_MAX && currentFrame?(count))
        if(strike?(count))
          if(nextframeStrike?(count))
            res+=PINS_MAX+strikeBonus(count)
            count=lastframeStrike(frame, count)
          else
            err = true
          end
        else
          if(nextFrame?(count))
            if(spare?(count))
              if(nextframeSpare?(count))
                res+=PINS_MAX+spareBonus(count)
                count+=2
              else
                err = true
              end
            elsif(errorScore?(count))
              raise "ErroScore"
            else
              res+=scoreFrame(count)
              count=lastframe(frame,count)
            end
          else
            err = true
          end
        end
      frame+=1
    end

    if(nextFrame?(count) && frame == FRAME_MAX && err==false)
      raise "ErroTerminado" #Jogado depois do jogo estar terminado
    end
    res
  end

  # Add code as needed

  def strike?(count)
    @rolls[count] == PINS_MAX
  end

  def strikeBonus(count)
    @rolls[count+1]+@rolls[count+2]
  end

  def spare?(count)
    @rolls[count]+@rolls[count+1]==PINS_MAX
  end

  def spareBonus(count)
    @rolls[count+2]
  end

  def scoreFrame(count)
    @rolls[count]+@rolls[count+1]
  end

  def nextframeStrike?(count)
    @rolls[count+1]!=nil && @rolls[count+2]!=nil
  end

  def nextframeSpare?(count)
    @rolls[count+2]!=nil
  end

  def currentFrame?(count)
    @rolls[count]!=nil
  end

  def nextFrame?(count)
    @rolls[count+1]!=nil
  end

  def errorScore?(count)
    @rolls[count]+@rolls[count+1]>PINS_MAX
  end

  def lastframe(frame,count)
    if(frame==FRAME_MAX-1)
      count+=1
    else
      count+=2
    end
  end

  def lastframeStrike(frame, count)
    if(frame==FRAME_MAX-1)
      count+=2
    else
      count+=1
    end
  end
end
