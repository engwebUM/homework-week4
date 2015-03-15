require_relative './bowling'
require 'rspec'

RSpec.describe Bowling do

	before do
		@game = Bowling.new
	end

  context '#roll' do

    it 'Faz um Strike no 1º lançamento' do
    	@game.roll(10)
    	expect(@game.jogadas.at(0).first_game).to match 10

  	end

  	it 'Spare após 1 jogada' do
  		@game.roll(2)
  		@game.roll(2)
  		@game.roll(4)
  		@game.roll(6)
  		expect(@game.jogadas.at(1).spare).to match 1
  	end
  	
  	it 'Fazer 10 jogadas' do 
  		for current_iteration_number in 1..20 do  
            @game.roll(3)
    	end
    	expect(@game.jogadas.size).to eq 10
    end	


  end


  context '#score' do
   
    it 'Faz um strike e a seguir derruba 8 pins' do
    	@game.roll(10)
    	@game.roll(4)
    	@game.roll(4)
    	expect(@game.score).to eq 26
    end

    it 'Faz um strike seguido de um spare e 4 pins' do
    	@game.roll(10)
    	@game.roll(4)
    	@game.roll(6)
    	@game.roll(2)
    	@game.roll(2)
    	expect(@game.score).to eq 36
    end

    it 'numero de rolls com 12 Strikes' do
    	for current_iteration_number in 1..12 do
    		@game.roll(10)
    	end
    	expect(@game.jogadas.size).to eq 12
    end		

    it '10 Strikes' do
    	for current_iteration_number in 1..12 do
    		@game.roll(10)
    	end
    	expect(@game.score).to eq 240
    end
  
  end
end
