# Homework - Week 4

I toke may solution for [last week's exercise](https://github.com/engwebUM/homework-week3),
and I applied the Design Principles.

I optimized my code for readability and maintainability.

The Code Smells I found were:
- long method;
- large class.

### Smell number 1 - long method

To solve this problem, I splited roll and score methods into many auxiliary methods. I also
created get methods into the class Frame. I removed code which was repeated, I
changed tabs to two spaces and I also removed some comments.

### Smell number 2 - large class

To solve this problem, I extracted the Bowling class, because the class had multiple
responsabilities. I put some responsability into the Frame class.

My Frame class has 7 methods and my Bowling class has 6 methods. Both classes have less or
equal 100 lines of code, and more public methods than private ones.

### New version of the code

class Frame
  attr_reader :firstL, :secondL, :flagSituation, :bonus
  def initialize
    @firstL = -1
    @secondL = -1
    @flagSituation = "N" #Normal situation: N || Strike: ST || Spare: SP
    @bonus = -1
  end

  def rollFirstLaunch(pins)
    if(pins == 10) then @flagSituation = "ST" end
    @firstL = pins
  end

  def rollSecondLaunch(pins)
    if(@firstL + pins == 10) then @flagSituation = "SP" end
    @secondL = pins
  end

  def rollBonus(pins)
    @bonus = pins
  end
  
  def scoreOfWholeFrame(index)    
    return getFirstLaunch + getSecondLaunch + getBonusLaunch
  end
  
  def getFirstLaunch
    if(@firstL != -1) then @firstL else 0 end
  end
  
  def getSecondLaunch
    if(@secondL != -1) then @secondL else 0 end
  end
  
  def getBonusLaunch
  	if(@bonus != -1) then @bonus else 0 end
  end
end

class Bowling
  attr_reader :frameList

  def initialize
    @frameList = []
  end

  def roll(pins)
    if(pins < 0 or pins > 10)
      "ErrNoPins: Invalid number of pins"
    elsif(@frameList.size == 0)
      frame = Frame.new
      frame.rollFirstLaunch(pins)
      @frameList.push(frame)
    elsif(@frameList.size == 10)
      lastFrameOfGame(pins)
    elsif(@frameList[@frameList.size - 1].firstL == -1)
      @frameList[@frameList.size - 1].rollFirstLaunch(pins)
      if(@frameList[@frameList.size - 1].flagSituation == "ST")
        frame = Frame.new
        @frameList.push(frame)
      end
    elsif(@frameList[@frameList.size - 1].secondL == -1)
      if(@frameList[@frameList.size - 1].flagSituation == "ST")
        frame = Frame.new
        frame.rollFirstLaunch(pins)
        @frameList.push(frame)
      elsif(@frameList[@frameList.size - 1].firstL + pins <= 10)
        @frameList[@frameList.size - 1].rollSecondLaunch(pins)
        frame = Frame.new
        @frameList.push(frame)
      else
        "ErrInsertSecondLaunch: It's not possible to insert the pins you rolled."
      end
    end
  end

  def lastFrameOfGame(pins)
    if(@frameList[9].flagSituation == "ST" or @frameList[9].flagSituation == "SP")
      lastFrameOfGameHasBonus(pins)
    elsif(@frameList[9].flagSituation == "N")
      lastFrameOfGameIsNormal(pins)
    end
  end
  
  def lastFrameOfGameHasBonus(pins)
    if(@frameList[9].secondL == -1 and @frameList[9].flagSituation == "ST")
      @frameList[9].rollSecondLaunch(pins)
    elsif(@frameList[9].bonus == -1)
      @frameList[9].rollBonus(pins)
    else
      "ErrEndGame2: Game finished, your bonus finished"
    end
  end
  
  def lastFrameOfGameIsNormal(pins)
    if(@frameList[9].firstL == -1)
      @frameList[9].rollFirstLaunch(pins)
    elsif(@frameList[9].secondL == -1)
      if(@frameList[9].firstL + pins <= 10)
        @frameList[9].rollSecondLaunch(pins)
      else
        "ErrInsertSecondLaunch: It's not possible to insert the pins you rolled."
      end
    else
      "ErrEndGame1: Game finished, you don't have bonus to play anymore"
    end
  end

  def score
    index = 0
    total = 0
    while (index < @frameList.size)
      if(index == 9 or @frameList[index].flagSituation == "N")
        total += @frameList[index].scoreOfWholeFrame(index)
      elsif(@frameList[index].flagSituation == "ST")
        total += 10 + scoreStrikeCase(index)
      elsif(@frameList[index].flagSituation == "SP")
        total += 10
        if(@frameList[index + 1] != nil) then total += @frameList[index + 1].getFirstLaunch end
      end
      index += 1
    end
    total
  end

  def scoreStrikeCase(index)
    total = 0
    if(@frameList[index + 1] != nil)
      if(@frameList[index + 1].flagSituation == "ST")
        total += 10
        if(index == 8)
          total += @frameList[9].getSecondLaunch
        elsif(@frameList[index + 2] != nil)
          total += @frameList[index + 2].getFirstLaunch
        end
      elsif(@frameList[index + 1].firstL != -1)
        total += @frameList[index + 1].getFirstLaunch + @frameList[index + 1].getSecondLaunch
      end
    end
    return total
  end
end
