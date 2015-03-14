require_relative './bowling'
require 'rspec'

#preserved invariant list
# 1) Um lançamento nao pode derrubar mais de 10 pinos
# 2) Um lançamento nao pode derrubar menos de 0 pinos
# 3) Não se podem jogar mais do que 12 frames
# 4) Strike na decima frame dá direito a 12 lançamentos
# 5) Spare na decima dá direito a 11 jogadas
# 6) Uma frame nunca pode ter mais do que 10 pontos
# 7) A pontuação de um strike é 10 + a pontuação das duas jogadas seguintes 
# 8) A pontuação de um spare é 10 + a pontuação da jogada seguinte

RSpec.describe Bowling do
	context '#roll' do

	  	it 'pins.jpg - test #roll' do
		   	b = Bowling.new
		   	b.roll(1);b.roll(4)
		   	b.roll(4);b.roll(5)
		   	b.roll(6);b.roll(4)
		   	b.roll(5);b.roll(5)
		   	b.roll(10);
		   	b.roll(0);b.roll(1)
		   	b.roll(7);b.roll(3)
		   	b.roll(6);b.roll(4)
		   	b.roll(10);
		   	b.roll(2);b.roll(8)
		   	b.roll(6);
		    expect(b.game).to eq [1, 4, 4, 5, 6, "spare", 5, "spare", "strike", 0, 1, 7, "spare", 6, "spare", "strike", 2, "spare", 6]
		end 

		it 'all striks - test #roll' do
		   	b = Bowling.new
			b.roll 10; b.roll 10 ; b.roll 10
			b.roll 10; b.roll 10 ; b.roll 10
			b.roll 10; b.roll 10 ; b.roll 10
			b.roll 10; b.roll 10 ; b.roll 10
		    expect(b.game).to eq ["strike", "strike", "strike", "strike", "strike", "strike", "strike", "strike", "strike", "strike", "strike", "strike"]
		end 

	    it 'all zero points - test #roll' do
		   	b = Bowling.new
			b.roll 0; b.roll 0; 
			b.roll 0; b.roll 0;
			b.roll 0; b.roll 0;
			b.roll 0; b.roll 0;
			b.roll 0; b.roll 0;
			b.roll 0; b.roll 0;
			b.roll 0; b.roll 0;
			b.roll 0; b.roll 0;
			b.roll 0; b.roll 0;
			b.roll 0; b.roll 0;
		    expect(b.game).to eq [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]
		end 

		it 'all spare s -  test #roll' do
		   	b = Bowling.new
			b.roll 5; b.roll 5; 
			b.roll 5; b.roll 5;
			b.roll 5; b.roll 5; 
			b.roll 5; b.roll 5;
			b.roll 5; b.roll 5;
			b.roll 5; b.roll 5;
			b.roll 5; b.roll 5;
			b.roll 5; b.roll 5;
			b.roll 5; b.roll 5;
			b.roll 5; b.roll 5;
			b.roll 5
		    expect(b.game).to eq [5, "spare", 5, "spare", 5, "spare", 5, "spare", 5, "spare", 5, "spare", 5, "spare", 5, "spare", 5, "spare", 5, "spare", 5]
		end 

		it 'all spare s - test #roll' do
		   	b = Bowling.new
			b.roll 1; b.roll 1; 
			b.roll 1; b.roll 1;
			b.roll 1; b.roll 1; 
			b.roll 1; b.roll 1;
			b.roll 1; b.roll 1;
			b.roll 1; b.roll 1;
			b.roll 1; b.roll 1;
			b.roll 1; b.roll 1;
			b.roll 1; b.roll 1;
			b.roll 1; b.roll 1;
		    expect(b.game).to eq [1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1]
		end 

  	end




	context '#score' do
	  	it 'pins.jpg - test #score' do
		   	b = Bowling.new
		   	b.roll(1);b.roll(4)
		   	b.roll(4);b.roll(5)
		   	b.roll(6);b.roll(4)
		   	b.roll(5);b.roll(5)
		   	b.roll(10);
		   	b.roll(0);b.roll(1)
		   	b.roll(7);b.roll(3)
		   	b.roll(6);b.roll(4)
		   	b.roll(10);
		   	b.roll(2);b.roll(8)
		   	b.roll(6);
		    expect(b.score).to eq 133
		end 

	  	it 'all striks - test #score' do
		   	b = Bowling.new
			b.roll 10; b.roll 10 ; b.roll 10
			b.roll 10; b.roll 10 ; b.roll 10
			b.roll 10; b.roll 10 ; b.roll 10
			b.roll 10; b.roll 10 ; b.roll 10
		   	expect(b.score).to eq 300
		end 

		it 'all zero points - test #score' do
		   	b = Bowling.new
			b.roll 0; b.roll 0; 
			b.roll 0; b.roll 0;
			b.roll 0; b.roll 0;
			b.roll 0; b.roll 0;
			b.roll 0; b.roll 0;
			b.roll 0; b.roll 0;
			b.roll 0; b.roll 0;
			b.roll 0; b.roll 0;
			b.roll 0; b.roll 0;
			b.roll 0; b.roll 0;
		   	expect(b.score).to eq 0
		end 

		it 'all spare s - test #score' do
		   	b = Bowling.new
			b.roll 5; b.roll 5; 
			b.roll 5; b.roll 5;
			b.roll 5; b.roll 5; 
			b.roll 5; b.roll 5;
			b.roll 5; b.roll 5;
			b.roll 5; b.roll 5;
			b.roll 5; b.roll 5;
			b.roll 5; b.roll 5;
			b.roll 5; b.roll 5;
			b.roll 5; b.roll 5;
			b.roll 5
		   	expect(b.score).to eq 150
		end 


		it 'all spare s - test #score' do
		   	b = Bowling.new
			b.roll 1; b.roll 1; 
			b.roll 1; b.roll 1;
			b.roll 1; b.roll 1; 
			b.roll 1; b.roll 1;
			b.roll 1; b.roll 1;
			b.roll 1; b.roll 1;
			b.roll 1; b.roll 1;
			b.roll 1; b.roll 1;
			b.roll 1; b.roll 1;
			b.roll 1; b.roll 1;
		    expect(b.score).to eq 20
		end 
    end


	context '#roll' do

		it '1º and 6º invariant' do 
			b = Bowling.new
			b.roll 1; b.roll 2
			b.roll 3; b.roll 9
			b.roll 5; b.roll 5
			expect(b.game).to eq [1, 2, 3]
			expect(b.score).to eq 6
		end

		it '1º invariant' do 
			b = Bowling.new
			b.roll 1; b.roll 2
			b.roll 100; b.roll 1
			b.roll 5; b.roll 5
			expect(b.game).to eq [1, 2]
			expect(b.score).to eq 3
		end

		it '2º invariant' do 
			b = Bowling.new
			b.roll 1; b.roll 2
			b.roll 3; b.roll 7
			b.roll -1; b.roll 5
			expect(b.game).to eq [1, 2, 3, "spare"]
			expect(b.score).to eq 13
		end


		it '3º and 4º invariant' do
		   	b = Bowling.new
			b.roll 10; b.roll 10 ; b.roll 10
			b.roll 10; b.roll 10 ; b.roll 10
			b.roll 10; b.roll 10 ; b.roll 10
			b.roll 10; b.roll 10 ; b.roll 10
			b.roll 10; b.roll 10 ; b.roll 10
			b.roll 10; b.roll 10 ; b.roll 10
			b.roll 10; b.roll 10 ; b.roll 10
			b.roll 10; b.roll 10 ; b.roll 10
			b.roll 10; b.roll 10 ; b.roll 10
			b.roll 10; b.roll 10 ; b.roll 10
			b.roll 10; b.roll 10 ; b.roll 10
			b.roll 10; b.roll 10 ; b.roll 10
			b.roll 10; b.roll 10 ; b.roll 10
			b.roll 10; b.roll 10 ; b.roll 10
			b.roll 10; b.roll 10 ; b.roll 10
			b.roll 10; b.roll 10 ; b.roll 10
			expect(b.game).to eq ["strike", "strike", "strike", "strike", "strike", "strike", "strike", "strike", "strike", "strike", "strike", "strike"]
		   	expect(b.score).to eq 300
		end 

		it '5º invariant' do
		   	b = Bowling.new
			b.roll 5; b.roll 5; 
			b.roll 5; b.roll 5;
			b.roll 5; b.roll 5; 
			b.roll 5; b.roll 5;
			b.roll 5; b.roll 5;
			b.roll 5; b.roll 5;
			b.roll 5; b.roll 5;
			b.roll 5; b.roll 5;
			b.roll 5; b.roll 5;
			b.roll 5; b.roll 5;
			b.roll 5; b.roll 5;
			b.roll 5; b.roll 5;
			b.roll 5; b.roll 5;
			b.roll 5; b.roll 5;
			b.roll 5; b.roll 5;
			expect(b.game).to eq [5, "spare", 5, "spare", 5, "spare", 5, "spare", 5, "spare", 5, "spare", 5, "spare", 5, "spare", 5, "spare", 5, "spare", 5]
		   	expect(b.score).to eq 150
		end 
	end


end
