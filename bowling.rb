class Bowling

  attr_reader :currentlyRollNumber, :rolls

  def initialize
    @rolls = Array.new(21, 0)
    @currentlyRollNumber = 0
    #@frameResult = Array.new(10)
  end

  def strikeCase
    @rolls[@currentlyRollNumber] = 10
    @rolls[@currentlyRollNumber+1] = "X"
    @currentlyRollNumber += 2
  end

  def normalCase(pins)
    @rolls[@currentlyRollNumber] = pins
    @currentlyRollNumber += 1
  end

  def spareCase
    @rolls[@currentlyRollNumber-1] = 10
    @rolls[@currentlyRollNumber] = "/"
    @currentlyRollNumber += 1
  end

  def firstTry(pins)
    if (pins == 10)
      strikeCase
    else
      normalCase(pins)
    end
  end

  def secondTry(pins)
    if ((pins+@rolls[@currentlyRollNumber-1])<10)
      normalCase(pins)
    else
      spareCase
    end
  end

  def roll(pins)
      #roll number 19,20,21 are different than the others, has no bonus
      if (@currentlyRollNumber < 18)
        if (@currentlyRollNumber.odd?)
          #adding bonus if striked on last roll
          if(@rolls[@currentlyRollNumber-2] == "X")
            @rolls[@currentlyRollNumber-3] += pins
          end
          #adding bonus if striked 2 times a row
          if(@rolls[@currentlyRollNumber-2] == "X" && @rolls[@currentlyRollNumber-4] == "X")
            @rolls[@currentlyRollNumber-5] += pins
          end
          #second try of each roll
          secondTry(pins)
        else
          #adding bonus if striked or spared on last roll
          if(@rolls[@currentlyRollNumber-1] == "/" || @rolls[@currentlyRollNumber-1] == "X")
            @rolls[@currentlyRollNumber-2] += pins
          end
          #adding bonus if striked 2 times a row
          if(@rolls[@currentlyRollNumber-1] == "X" && @rolls[@currentlyRollNumber-3] == "X")
            @rolls[@currentlyRollNumber-4] += pins
          end
          #first try of each roll
          firstTry(pins)
        end
      else
        #last frame
        #first roll
        if (@currentlyRollNumber == 18)
          #adding bonus if striked or spared on last roll
          if(@rolls[@currentlyRollNumber-1] == "/" || @rolls[@currentlyRollNumber-1] == "X")
            @rolls[@currentlyRollNumber-2] += pins
          end
          @rolls[@currentlyRollNumber] = pins
          @currentlyRollNumber += 1
        #second roll
        elsif (@currentlyRollNumber == 19)
          #adding bonus if striked on last roll
          if(@rolls[@currentlyRollNumber-2] == "X")
            @rolls[@currentlyRollNumber-5] += pins
          end
          #adding bonus if striked 2 times a row
          if(@rolls[18] == 10 && @rolls[@currentlyRollNumber-2] == "X")
            @rolls[@currentlyRollNumber-3] += pins
          end
          #if didnt spared/striked before
          @rolls[@currentlyRollNumber] = pins
          if (@rolls[18] == 10)
            #strike
            @rolls[@currentlyRollNumber] = pins
          else
            #normal case
            #check if the number of pins of second roll try
            #didn't reached the limit (10 pins for each roll)
            if ((pins+@rolls[@currentlyRollNumber-1])<10)
              @rolls[@currentlyRollNumber] = pins
            else
              if ((pins+@rolls[@currentlyRollNumber-1]) == 10)
                #Spare case
                @rolls[@currentlyRollNumber-1] = 10
                @rolls[@currentlyRollNumber] = "/"
              else
                raise "Invalid number of pins"
              end
            end
          end
          @currentlyRollNumber += 1
        #third roll
        elsif (@currentlyRollNumber == 20)
          #In case we do a spare, or 2 strikes a row, or just playing the last ball
          if (@rolls[@currentlyRollNumber-1] == "/" || @rolls[@currentlyRollNumber-1] == 10 || @rolls[@currentlyRollNumber-2] == 10)
            @rolls[@currentlyRollNumber] += pins
            @currentlyRollNumber += 1
          else
            @currentlyRollNumber += 1
            raise "You didn't spared/striked before, you can't play the 3rd ball"
          end
        elsif (@currentlyRollNumber > 20)
          raise "No rolls left, game is over"
        end
      end
  end

  def score
    $score = 0
    for i in 0...21
      $score += roll_score(i)
    end
    return $score
  end

  def roll_score(iteration)
    $frame_score = @rolls[iteration]
    if($frame_score == "X" || $frame_score == "/")
      $frame_score = 0
    end
    return $frame_score
  end
end
