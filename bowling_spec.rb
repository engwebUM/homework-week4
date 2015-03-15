require_relative './bowling'
require 'rspec'

RSpec.describe Bowling do

  context '#roll' do
    bowling = Bowling.new
    it "expect frames with [[2]]" do
      bowling.roll(2)
      expect(bowling.frames[0]).to eq [2]
    end

    it "expect array with [2,4]" do
      bowling.roll(4)
      expect(bowling.frames[0]).to eq [2,4]
    end

    it "expect array with [[2,4],[10,0]]" do
      bowling.roll(10)
      expect(bowling.frames).to eq [[2,4],[10,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0],[0,0]]
    end

    it "full game from pins.jpg" do
      full_game = Bowling.new
      full_game.roll(1)
      full_game.roll(4)
      full_game.roll(4)
      full_game.roll(5)
      full_game.roll(6)
      full_game.roll(4)
      full_game.roll(5)
      full_game.roll(5)
      full_game.roll(10)
      full_game.roll(0)
      full_game.roll(1)
      full_game.roll(7)
      full_game.roll(3)
      full_game.roll(6)
      full_game.roll(4)
      full_game.roll(10)
      full_game.roll(2)
      full_game.roll(8)
      full_game.roll(6)
      expect(full_game.frames).to eq [[1,4],[4,5],[6,4],[5,5],[10,0],[0,1],[7,3],[6,4],[10,0],[2,8,6]]
  end

  end
  context '#score' do
    bowling = Bowling.new
    it "expect score 0" do
      expect(bowling.score).to eq 0
    end

    it "expect score 2" do
      bowling.roll(2)
      expect(bowling.score).to eq 2
    end

    it "expect score 2" do
      bowling.roll(2)
      expect(bowling.score).to eq 4
    end

    it"strike expect score 24" do
      bowling.roll(10)
      bowling.roll(2)
      bowling.roll(3)
      expect(bowling.score).to eq 24
    end

    it"spare expect score 40" do
      bowling.roll(5)
      bowling.roll(5)
      bowling.roll(3)
      expect(bowling.score).to eq 40
    end

    it "full game from pins.jpg" do
      full_game = Bowling.new
      full_game.roll(1)
      full_game.roll(4)
      full_game.roll(4)
      full_game.roll(5)
      full_game.roll(6)
      full_game.roll(4)
      full_game.roll(5)
      full_game.roll(5)
      full_game.roll(10)
      full_game.roll(0)
      full_game.roll(1)
      full_game.roll(7)
      full_game.roll(3)
      full_game.roll(6)
      full_game.roll(4)
      full_game.roll(10)
      full_game.roll(2)
      full_game.roll(8)
      full_game.roll(6)
      expect(full_game.score).to eq 133
    end
  end
end
