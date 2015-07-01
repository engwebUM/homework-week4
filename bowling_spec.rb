require_relative 'bowling'
require 'rspec'

RSpec.describe Bowling do

  context '#roll' do
    it 'receives a roll' do
  end
end

 
context '#score' do

    it '10 rolls with 2 whithout SPARES or STRIKES' do
      bowling = Bowling.new
      for current_iteration_number in 1..10 do  
        bowling.roll(2)
      end
      expect(bowling.totalScore).to eq 20
    end

    it "20 rolls with 0" do
      bowling = Bowling.new
      for current_iteration_number in 1..20 do  
        bowling.roll(0)
      end
      expect(bowling.totalScore).to eq 0
    end

    it "10 rolls with 5" do
      bowling = Bowling.new
      for current_iteration_number in 1..10 do  
        bowling.roll(5)
      end
      expect(bowling.totalScore).to eq 70
    end

  end
end