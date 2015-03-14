require_relative './bowling'
require 'rspec'

RSpec.describe Bowling do
	let(:game) { Bowling.new }

	context '#roll' do
		it "The Perfect Game" do
			game.roll(10)
			game.roll(10)
			game.roll(10)
			game.roll(10)
			game.roll(10)
			game.roll(10)
			game.roll(10)
			game.roll(10)
			game.roll(10)
			game.roll(10)
			game.roll(10)
			game.roll(10)
			expect(game.score).to eq 300
		end
	end

	context '#roll' do
		it "The Bad Game" do
			game.roll(0)
			game.roll(0)
			game.roll(0)
			game.roll(0)
			game.roll(0)
			game.roll(0)
			game.roll(0)
			game.roll(0)
			game.roll(0)
			game.roll(0)			
			expect(game.score).to eq 0
		end
	end

	context '#roll' do
		it "The Game Example in HomeWork" do
			game.roll(1)
			game.roll(4)
			game.roll(4)
			game.roll(5)
			game.roll(6)
			game.roll(4)
			game.roll(5)
			game.roll(5)
			game.roll(10)
			game.roll(0)
			game.roll(1)
			game.roll(7)
			game.roll(3)
			game.roll(6)
			game.roll(4)
			game.roll(10)
			game.roll(2)
			game.roll(8)
			game.roll(6)			
			expect(game.score).to eq 133
		end
	end

	context '#roll' do
		it "The Game Example in HomeWork, 7 frames" do
			game.roll(1)
			game.roll(4)
			game.roll(4)
			game.roll(5)
			game.roll(6)
			game.roll(4)
			game.roll(5)			
			expect(game.score).to eq 34
		end
	end

	context '#roll' do
		it "The Example Game" do
			game.roll(10)
			game.roll(9)
			game.roll(1)
			game.roll(9)
			game.roll(1)
			game.roll(9)
			game.roll(1)
			game.roll(9)
			game.roll(1)
			game.roll(7)
			game.roll(0)
			game.roll(9)
			game.roll(0)
			game.roll(10)
			game.roll(8)
			game.roll(2)
			game.roll(8)
			game.roll(2)
			game.roll(10)			
			expect(game.score).to eq 168
		end
	end

	context '#roll' do
		it "The Example Game, 15 frames" do
			game.roll(8)
			game.roll(2)
			game.roll(8)
			game.roll(1)
			game.roll(9)
			game.roll(1)
			game.roll(7)
			game.roll(1)
			game.roll(8)
			game.roll(2)
			game.roll(9)
			game.roll(1)
			game.roll(9)
			game.roll(1)
			game.roll(10)			
			expect(game.score).to eq 120
		end
	end

	context '#roll' do
		it "The Example Game, 4 frames" do
			game.roll(10)
			game.roll(10)
			game.roll(9)
			game.roll(0)			
			expect(game.score).to eq 57
		end
	end

	context '#score' do
		it "Show the Score Before Starting the Game" do			
			expect(game.score).to eq 0
		end
	end
end