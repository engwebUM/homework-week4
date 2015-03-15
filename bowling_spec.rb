require_relative './bowling'
require 'rspec'

RSpec.describe Bowling do
  
  context '#roll' do

  	 it 'receives a roll' do

    # ...
  end

end

  context '#score' do

    it "receives 20 rolls with 0" do
      bowling = Bowling.new
      for current_iteration_number in 1..20 do  
           bowling.roll(0) # Fail all rolls
          end
      expect(bowling.score).to eq 0
    end

    it 'receives 10 rolls whithout SPARES or STRIKES' do
          bowling = Bowling.new
         for current_iteration_number in 1..10 do  
          bowling.roll(2)
         end
          expect(bowling.score).to eq 20
    end

  	 it 'receives 3 rolls (6,4,6) test SPARE' do
  	        bowling = Bowling.new
  	        bowling.roll(6)
  	        bowling.roll(4) #SPARE
  	        bowling.roll(6)
  	    
  	        expect(bowling.score).to eq 22 # 6 + 4 + 6 + 6(bonus Spare)
  	 end


    it "receives 1 pin Downed" do
          bowling = Bowling.new
          bowling.roll(1)
          expect(bowling.score).to eq 1
    end

    it "receives 10 rolls with 5" do
          bowling = Bowling.new
          for current_iteration_number in 1..10 do  
            bowling.roll(5)
          end
          expect(bowling.score).to eq 70
    end

    it "receives 20 rolls with 5" do
          bowling = Bowling.new
          for current_iteration_number in 1..20 do  
            bowling.roll(5)
          end
          expect(bowling.score).to eq 145
    end

    it "receives rolls with 10 combinations of 4 and 3 pins" do
      bowling = Bowling.new
      for current_iteration_number in 1..10 do  
        bowling.roll(4)
        bowling.roll(3)
      end
      expect(bowling.score).to eq 70
    end
    
    it "receives rolls with 10 combinations of 6 and 2 pins" do
      bowling = Bowling.new
      for current_iteration_number in 1..10 do  
        bowling.roll(6)
        bowling.roll(2)
      end
      expect(bowling.score).to eq 80
    end

    it "receives a STRIKE in the 2nd roll of the 1st Frame" do
      bowling = Bowling.new
      bowling.roll(0)
      bowling.roll(10) #STRIKE 
      bowling.roll(4)
      expect(bowling.score).to eq 18 #10 + 4 + 4(bonus)
    end

    it "receives a STRIKE in the  1st roll (bonus in the next 2 rolls)" do
      bowling = Bowling.new
      bowling.roll(10) #STRIKE 
      bowling.roll(4)   
      bowling.roll(4)
      expect(bowling.score).to eq(26) # 10 + 4 + 4(bonus) + 4 + 4(bonus)
    end

    it "receives a STRIKE in the 1st roll and a SPARE in the next Frame" do
      bowling = Bowling.new
      bowling.roll(10) #STRIKE
      bowling.roll(8)  
      bowling.roll(2)  #SPARE
      bowling.roll(3)  
      bowling.score.should eq(36) # 10 + 8 +8(bonus Strike) + 2 +2(bonus Strike) + 3 + 3(bonus Spare) 
    end

    
    it "receives 10 STRIKES" do
      bowling = Bowling.new
       for current_iteration_number in 1..10 do  
        bowling.roll(10)
      end
      expect(bowling.score).to eq 270 # 10 perfect rolls without bonus balls
    end


    it "receives 10 STRIKES + 2 STRIKES in the bonus balls" do
      bowling = Bowling.new
       for current_iteration_number in 1..12 do  
        bowling.roll(10)
      end
     expect(bowling.score).to eq 300 #perfect game
    end
  end
end