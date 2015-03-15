require_relative './bowling'
require 'rspec'

RSpec.describe Bowling do
  let(:bowling) {Bowling.new}

  def roll_balls(bowling_obj, rolls)
    rolls.each do |roll|
      bowling_obj.roll(roll)
    end
  end

  context '#roll' do
    it 'accepts a normal roll' do
      expect { bowling.roll(10) }.not_to raise_error
    end

    it 'rejects a negative roll' do
      expect { bowling.roll(-1) }.to raise_error("impossible play")
    end

    it 'rejects a roll greater than 10' do
      expect { bowling.roll(11) }.to raise_error("impossible play")
    end

    it 'rejects a roll greater than standing pins' do
      bowling.roll(6)

      expect { bowling.roll(6) }.to raise_error("impossible play")
    end

    it 'rejects a roll after the game is over' do
      for i in 1..20
        bowling.roll(0)
      end

      expect { bowling.roll(10) }.to raise_error("game over")
    end
  end

  context '#score' do
    it 'returns score 0 when game is started' do
      expect(bowling.score).to eq 0
    end

    it 'returns correct score after rolling 1 pin' do
      bowling.roll(1)

      expect(bowling.score).to eq 1
    end

    it 'returns correct score after missing every time' do
      for i in 1..20
        bowling.roll(0)
      end

      expect(bowling.score).to eq 0
    end

    it 'returns correct score after a spare' do
      roll_balls(bowling, [7, 3, 2, 1])

      expect(bowling.score).to eq 15
    end

    it 'returns correct score after a strike' do
      roll_balls(bowling, [10, 2, 1])

      expect(bowling.score).to eq 16
    end

    it 'returns correct score after two consecutive strikes' do
      roll_balls(bowling, [10, 10, 2, 1])

      expect(bowling.score).to eq 38
    end

    it 'returns correct score after 12 strikes' do
      for i in 1..12
        bowling.roll(10)
      end

      expect(bowling.score).to eq 300
    end

    it 'returns correct score after rolling 5 everytime' do
      for i in 1..21
        bowling.roll(5)
      end

      expect(bowling.score).to eq 150
    end

    it 'returns correct score after a predefined game' do
      roll_balls(bowling, [1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8, 6])

      expect(bowling.score).to eq 133
    end

    it 'returns correct score after multiple games with edge cases' do
      bowling1, bowling2, bowling3 = Bowling.new, Bowling.new, Bowling.new
      bowling4, bowling5, bowling6 = Bowling.new, Bowling.new, Bowling.new
      bowling7, bowling8, bowling9 = Bowling.new, Bowling.new, Bowling.new

      roll_balls(bowling1, [6, 4, 6, 4, 6, 4, 6, 4, 6, 4, 6, 4, 6, 4, 6, 4, 6, 4, 6, 4, 6])
      roll_balls(bowling2, [0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0])
      roll_balls(bowling3, [10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0, 10, 0])
      roll_balls(bowling4, [10, 5, 5, 10, 5, 5, 10, 5, 5, 10, 5, 5, 10, 5, 5, 10])
      roll_balls(bowling5, [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 1, 0])
      roll_balls(bowling6, [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 1, 0])
      roll_balls(bowling7, [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 10])
      roll_balls(bowling8, [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 5, 5, 10, 10, 10])
      roll_balls(bowling9, [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 10, 10, 10, 10])

      expect(bowling1.score).to eq 160
      expect(bowling2.score).to eq 100
      expect(bowling3.score).to eq 110
      expect(bowling4.score).to eq 200
      expect(bowling5.score).to eq 11
      expect(bowling6.score).to eq 12
      expect(bowling7.score).to eq 30
      expect(bowling8.score).to eq 50
      expect(bowling9.score).to eq 60
    end
  end
end
