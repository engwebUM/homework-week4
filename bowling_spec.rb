require_relative './bowling'
require 'rspec'

RSpec.describe Bowling do
  context '#roll' do
    it 'verify roll with more than 10 pins' do
      expect {
      b = Bowling.new
      b.roll 11
      }.to raise_error
    end

    it 'verify roll with 10 pins' do
      b = Bowling.new
      b.roll 10
      output=b.score
      expect(output).to eq 10
    end

    it 'verify roll with less than 0 pins' do
      expect {
      b = Bowling.new
      b.roll -1
      }.to raise_error
    end

    it 'verify roll with 0 pins' do
      b = Bowling.new
      b.roll 0
      output=b.score
      expect(output).to eq 0
    end

    it 'verify when frames are higher than 10' do
      expect {
      b = Bowling.new

      for i in 0..12
        b.roll 10
      end
      }.to raise_error
    end

    it 'verify when frames are equals to 10' do
      b = Bowling.new

      for i in 0..11
        b.roll 10
      end

      output=b.score
      expect(output).to eq 300
    end

    it 'verify when execute 22 rolls' do
      expect {
      b = Bowling.new

      for i in 0..21
        b.roll 5
      end
      }.to raise_error
    end

    it 'verify when execute 21 rolls' do
      b = Bowling.new

      for i in 0..20
        b.roll 5
      end

      output=b.score
      expect(output).to eq 150
    end

    it 'verify when tenth frame contains strike can play extra frame' do
      b = Bowling.new

      for i in 0..9
        b.roll 10
      end
      b.roll 2  #extra bonus first attempt
      b.roll 8  #extra bonus second attempt

      output=b.score
      expect(output).to eq 282
    end

    it 'verify when tenth frame contains spare can play extra frame' do
      b = Bowling.new

      for i in 0..8
        b.roll 10
      end
      b.roll 2  #tenth frame first attempt
      b.roll 8  #tenth frame second attempt (2+8 = spare)
      b.roll 9  #extra/bonus frame

      output=b.score
      expect(output).to eq 271
    end

    it 'verify when tenth frame does not contains spare or strike cannot play extra frame' do
      expect {
      b = Bowling.new

      for i in 0..8
        b.roll 10
      end

      b.roll 2  #tenth frame first attempt
      b.roll 7  #tenth frame second attempt (2+7 = 9)
      b.roll 9  #extra/bonus frame
      }.to raise_error
    end

    it 'verify case with strike in the tenth frame and 2 extra balls' do
      b = Bowling.new

      b.roll 1; b.roll 4
      b.roll 4; b.roll 5
      b.roll 6; b.roll 4
      b.roll 5; b.roll 5
      b.roll 10
      b.roll 0; b.roll 1
      b.roll 7; b.roll 3
      b.roll 6; b.roll 4
      b.roll 10
      b.roll 10
      b.roll 8; b.roll 2

      output=b.score
      expect(output).to eq 145
    end

    it 'verify case with spare in the tenth frame and 1 extra ball' do
      b = Bowling.new

      b.roll 1; b.roll 4
      b.roll 4; b.roll 5
      b.roll 6; b.roll 4
      b.roll 5; b.roll 5
      b.roll 10
      b.roll 0; b.roll 1
      b.roll 7; b.roll 3
      b.roll 6; b.roll 4
      b.roll 10
      b.roll 8; b.roll 2
      b.roll 7

      output=b.score
      expect(output).to eq 134
    end

    it 'verify case with strike in the tenth frame and 3 extra balls' do

      expect {
      b = Bowling.new

      b.roll 1; b.roll 4
      b.roll 4; b.roll 5
      b.roll 6; b.roll 4
      b.roll 5; b.roll 5
      b.roll 10
      b.roll 0; b.roll 1
      b.roll 7; b.roll 3
      b.roll 6; b.roll 4
      b.roll 10
      b.roll 10
      b.roll 8; b.roll 2; b.roll 2

      }.to raise_error
    end

    it 'verify case with spare in the tenth frame and 2 extra balls' do

      expect {
      b = Bowling.new

      b.roll 1; b.roll 4
      b.roll 4; b.roll 5
      b.roll 6; b.roll 4
      b.roll 5; b.roll 5
      b.roll 10
      b.roll 0; b.roll 1
      b.roll 7; b.roll 3
      b.roll 6; b.roll 4
      b.roll 10
      b.roll 8; b.roll 2
      b.roll 6; b.roll 3

      }.to raise_error
    end
  end

  context '#score' do
    it 'verify maximum points possible' do
      b = Bowling.new

      for i in 0..11
        b.roll 10
      end

      output=b.score
      expect(output).to eq 300
    end

    it 'verify when all frames hit 5 pins' do
      b = Bowling.new

      for i in 0..20
        b.roll 5
      end

      output=b.score
      expect(output).to eq 150
    end

    it 'verify minimum points possible' do
      b = Bowling.new

      for i in 0..19
        b.roll 0
      end

      output=b.score
      expect(output).to eq 0
    end

    it 'verify one simple roll' do
      b = Bowling.new

      b.roll 8

      output=b.score
      expect(output).to eq 8
    end

    it 'verify invalid number of pins for second roll' do
      expect {
      b = Bowling.new

      b.roll 8
      b.roll 3

      }.to raise_error
    end

    it 'verify valid number of pins for second roll' do
      b = Bowling.new

      b.roll 8
      b.roll 1

      output=b.score
      expect(output).to eq 9
    end

    it 'verify pins.jpg test' do
      b = Bowling.new

      b.roll 1; b.roll 4
      b.roll 4; b.roll 5
      b.roll 6; b.roll 4
      b.roll 5; b.roll 5
      b.roll 10
      b.roll 0; b.roll 1
      b.roll 7; b.roll 3
      b.roll 6; b.roll 4
      b.roll 10
      b.roll 2; b.roll 8; b.roll 6

      output=b.score
      expect(output).to eq 133
    end


    it 'verify extra points for a spare' do
      b = Bowling.new

      b.roll 8
      b.roll 2
      b.roll 3

      output=b.score
      expect(output).to eq 16
    end

    it 'verify extra points for a strike' do
      b = Bowling.new

      b.roll 10
      b.roll 3
      b.roll 5

      output=b.score
      expect(output).to eq 26
    end

    it 'verify extra points for a strike when next frame contains a strike' do
      b = Bowling.new

      b.roll 10
      b.roll 10
      b.roll 5
      b.roll 2

      output=b.score
      expect(output).to eq 49
    end

    it 'verify extra points for a strike when next frame does not contains score' do
      b = Bowling.new

      b.roll 10
      b.roll 10
      b.roll 5
      #b.roll 2

      output=b.score
      expect(output).to eq 45
    end

    #when happens a strike for ninth frame than calculation is based on bonus frame
    #when tenth frame contains a strike
    it 'verify extra points for a strike on ninth frame' do
      b = Bowling.new

      b.roll 1; b.roll 4
      b.roll 4; b.roll 5
      b.roll 6; b.roll 4
      b.roll 5; b.roll 5
      b.roll 10
      b.roll 0; b.roll 1
      b.roll 7; b.roll 3
      b.roll 6; b.roll 4
      b.roll 10
      b.roll 10 #10
      b.roll 8

      output=b.score
      expect(output).to eq 143
    end
  end
end
