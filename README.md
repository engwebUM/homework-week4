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
