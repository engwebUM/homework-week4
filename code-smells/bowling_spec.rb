require_relative './bowling'
require 'rspec'

RSpec.describe Bowling do
  let (:bowling) { Bowling.new }

  def roll_times(num, pins)
    num.times {bowling.roll(pins)}
  end

  def make_strike()
    bowling.roll(10)
  end

  def make_spare()
    bowling.roll(4)
    bowling.roll(6)
  end

  context '#score' do
    it "expect score 0 for a worst game" do
      roll_times(21, 0)
      expect(bowling.score).to eq 0
    end
    it "expect score 10 for hit a pin in each roll" do
      roll_times(10, 1)
      expect(bowling.score).to eq 10
    end
    it "expect score 30 for hit three pins in each roll" do
      roll_times(10, 3)
      expect(bowling.score).to eq 30
    end
    it "expect score 300 for excellent game" do
      roll_times(12, 10)
      expect(bowling.score).to eq 300
    end
    it "expect score 28 for a strike and then roll 2 and 7 pins" do
        make_strike 
        bowling.roll(2)
        bowling.roll(7)
        expect(bowling.score).to eq 28
    end
    it "expect score 21 for a spare and then roll 2 and 7 pins" do
        make_spare 
        bowling.roll(2)
        bowling.roll(7)
        expect(bowling.score).to eq 21
    end
    it "simulate a complete game for score 180" do
      bowling.roll(10)
      .roll(10)
      .roll(10)
      .roll(7).roll(2)
      .roll(8).roll(2)
      .roll(0).roll(9)
      .roll(10)
      .roll(7).roll(3)
      .roll(9).roll(0)
      .roll(10).roll(10).roll(8)
      expect(bowling.score).to eq 180
    end
  end
end
