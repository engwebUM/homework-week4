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

My Frame class has 7 methods and my Bowling class has 10 methods. My Frame class has less
than 100 lines of code. Each class has more public methods than private ones.

```ruby
class Frame
  attr_reader :firstLaunch, :secondLaunch, :specialThirdLaunch, :bonusFlag
	
  def initialize
    @firstLaunch = -1
    @secondLaunch = -1
    @specialThirdLaunch = -1
    @bonusFlag = 0 # 0->Normal | 1->Strike | 2->Spare
  end
		
  def setFirstLaunch(pins)
    if pins == 10 then @bonusFlag = 1 end
      @firstLaunch = pins
  end
		
  def setSecondLaunch(pins, maxFrameFlag)
    if pins + @firstLaunch > 10 and maxFrameFlag == 1
      "Error3: The number of pins you want to add is incorrect."
    else
      if pins + @firstLaunch == 10 then @bonusFlag = 2 end
      @secondLaunch = pins
    end
  end
	
  def setThirdLaunch(pins)
    @specialThirdLaunch = pins
  end
  
  def scoreOfFrame
    sum = 0
    
    if (@firstLaunch != -1)	
      sum += @firstLaunch
      if (@secondLaunch != -1)
        sum += @secondLaunch + getThirdLaunch
      end				
    end
    return sum
  end
  
  def getFirstLaunch
    if (@firstLaunch != -1) then return @firstLaunch else 0 end
  end
  
  def getSecondLaunch
    if (@secondLaunch != -1) then return @secondLaunch else 0 end
  end
  
  def getThirdLaunch
    if (@specialThirdLaunch != -1) then return @specialThirdLaunch else 0 end
  end
end

class Bowling
  attr_reader :frames, :actualFrame
	
  def initialize
    @frames = []
    @actualFrame = 0
    @maxFrame = 9
  end

  def roll(pins)
    if (pins < 0 or pins > 10)
      "Error1: Invalid number of pins"
    elsif (@actualFrame == @maxFrame)
      rollMaxFrame(pins)
    else
      rollNormalFrame(pins)
    end
  end
  
  def rollMaxFrame(pins)
    if (@frames[@maxFrame].bonusFlag > 0)
      rollMaxFrameStrikeAndSpareCase(pins, 2 - @frames[@maxFrame].bonusFlag)
    else
      rollMaxFrameNormalCase(pins)
    end
  end
  
  def rollMaxFrameStrikeAndSpareCase(pins, isStrike)
    if (isStrike == 1 and @frames[@maxFrame].secondLaunch == -1)
      @frames[@maxFrame].setSecondLaunch(pins, 0)
    elsif (@frames[@maxFrame].specialThirdLaunch == -1)
      @frames[@maxFrame].setThirdLaunch(pins)
    else
      "Error2: The game is finished. No more launchs."
    end
  end
  
  def rollMaxFrameNormalCase(pins)
    if (@frames[@maxFrame].firstLaunch == -1)
      @frames[@maxFrame].setFirstLaunch(pins)
    elsif (@frames[@maxFrame].secondLaunch == -1)
      @frames[@maxFrame].setSecondLaunch(pins, 1)
    else
      "Error2_3: The game is finished. No more launchs."
    end
  end
  
  def rollFirstFrame(pins)
    if(@frames.size == 0)
      frame = Frame.new
      frame.setFirstLaunch(pins)
      @frames.push(frame)
    elsif(@frames[0].firstLaunch == 10)
      frame = Frame.new
      frame.setFirstLaunch(pins)
      @frames.push(frame)
      @actualFrame += 1
    elsif(@frames[0].secondLaunch == -1)
      rollFrameSecondLaunch(0, pins)
    else
      frame = Frame.new
      frame.setFirstLaunch(pins)
      @frames.push(frame)
      @actualFrame += 1
    end
  end
  
  def rollFrameSecondLaunch(index, pins)
    if(@frames[index].firstLaunch + pins <= 10)
      @frames[index].setSecondLaunch(pins, 0)						
      frame = Frame.new
      @frames.push(frame)
      @actualFrame += 1
    else
      "Error4: The number of pins dropped in the frame exceeded the limit of 10"
    end
  end
  
  def rollNormalFrame(pins)
    if (@actualFrame == 0)		
      rollFirstFrame(pins)
    elsif (@frames[@actualFrame].firstLaunch == -1)
      @frames[@actualFrame].setFirstLaunch(pins)
    elsif (@frames[@actualFrame].firstLaunch == 10)
      frame = Frame.new
      frame.setFirstLaunch(pins)
      @frames.push(frame)
      @actualFrame += 1
    elsif (@frames[@actualFrame].secondLaunch == -1)
      rollFrameSecondLaunch(@actualFrame, pins)
    else
      frame = Frame.new
      frame.setFirstLaunch(pins)
      @frames.push(frame)
      @actualFrame += 1
    end
  end  
  
  def score
    index = 0
    result = 0

    (@frames.size).times do		
      if(index == @maxFrame)				
        result += @frames[@maxFrame].scoreOfFrame
      elsif (@frames[index].bonusFlag > 0)
        result += 10 + scoreStrikeAndSpareCases(index)
      else
        result += @frames[index].getFirstLaunch + @frames[index].getSecondLaunch
      end
      index += 1
    end
    result
  end
  
  def scoreStrikeAndSpareCases(index)
    sum = 0
    if(@frames[index + 1] != nil)
      sum += @frames[index + 1].getFirstLaunch
      if(@frames[index].bonusFlag == 1) then sum += scoreStrikeCase(index) end
    end
    return sum
  end
  
  def scoreStrikeCase(index)
    sum = 0
    if (@frames[index + 1].bonusFlag == 1)
      if (@frames[index + 2] != nil)
        sum += @frames[index + 2].getFirstLaunch
      elsif (index == (@maxFrame - 1))
        sum += @frames[index + 1].getSecondLaunch
      end	
    else
      sum += @frames[index + 1].getSecondLaunch
    end
    return sum
  end
end
```
