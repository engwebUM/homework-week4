require_relative './bowling'
require 'rspec'

RSpec.describe Bowling do
	let(:jogoPerfeito) { Bowling.new }

	context '#roll' do
		it "O Jogo Perfeito" do
			jogoPerfeito.roll(10)
			jogoPerfeito.roll(10)
			jogoPerfeito.roll(10)
			jogoPerfeito.roll(10)
			jogoPerfeito.roll(10)
			jogoPerfeito.roll(10)
			jogoPerfeito.roll(10)
			jogoPerfeito.roll(10)
			jogoPerfeito.roll(10)
			jogoPerfeito.roll(10)
			jogoPerfeito.roll(10)
			jogoPerfeito.roll(10)

			expect(jogoPerfeito.score).to eq 300
		end
	end

	context '#roll' do
		it "O Jogo Miserável" do
			jogoPerfeito.roll(0)
			jogoPerfeito.roll(0)
			jogoPerfeito.roll(0)
			jogoPerfeito.roll(0)
			jogoPerfeito.roll(0)
			jogoPerfeito.roll(0)
			jogoPerfeito.roll(0)
			jogoPerfeito.roll(0)
			jogoPerfeito.roll(0)
			jogoPerfeito.roll(0)
			
			expect(jogoPerfeito.score).to eq 0
		end
	end

	context '#roll' do
		it "O Jogo Exemplo do HomeWork" do
			jogoPerfeito.roll(1)
			jogoPerfeito.roll(4)
			jogoPerfeito.roll(4)
			jogoPerfeito.roll(5)
			jogoPerfeito.roll(6)
			jogoPerfeito.roll(4)
			jogoPerfeito.roll(5)
			jogoPerfeito.roll(5)
			jogoPerfeito.roll(10)
			jogoPerfeito.roll(0)
			jogoPerfeito.roll(1)
			jogoPerfeito.roll(7)
			jogoPerfeito.roll(3)
			jogoPerfeito.roll(6)
			jogoPerfeito.roll(4)
			jogoPerfeito.roll(10)
			jogoPerfeito.roll(2)
			jogoPerfeito.roll(8)
			jogoPerfeito.roll(6)
			
			expect(jogoPerfeito.score).to eq 133
		end
	end

	context '#roll' do
		it "O Jogo Exemplo do HomeWork ao fim de 7 lançamentos" do
			jogoPerfeito.roll(1)
			jogoPerfeito.roll(4)
			jogoPerfeito.roll(4)
			jogoPerfeito.roll(5)
			jogoPerfeito.roll(6)
			jogoPerfeito.roll(4)
			jogoPerfeito.roll(5)
			
			expect(jogoPerfeito.score).to eq 34
		end
	end

	context '#roll' do
		it "Exemplo de um determinado jogo" do
			jogoPerfeito.roll(10)
			jogoPerfeito.roll(9)
			jogoPerfeito.roll(1)
			jogoPerfeito.roll(9)
			jogoPerfeito.roll(1)
			jogoPerfeito.roll(9)
			jogoPerfeito.roll(1)
			jogoPerfeito.roll(9)
			jogoPerfeito.roll(1)
			jogoPerfeito.roll(7)
			jogoPerfeito.roll(0)
			jogoPerfeito.roll(9)
			jogoPerfeito.roll(0)
			jogoPerfeito.roll(10)
			jogoPerfeito.roll(8)
			jogoPerfeito.roll(2)
			jogoPerfeito.roll(8)
			jogoPerfeito.roll(2)
			jogoPerfeito.roll(10)
			
			expect(jogoPerfeito.score).to eq 168
		end
	end

	context '#roll' do
		it "Exemplo de um determinado jogo ao fim de 15 lançamentos" do
			jogoPerfeito.roll(8)
			jogoPerfeito.roll(2)
			jogoPerfeito.roll(8)
			jogoPerfeito.roll(1)
			jogoPerfeito.roll(9)
			jogoPerfeito.roll(1)
			jogoPerfeito.roll(7)
			jogoPerfeito.roll(1)
			jogoPerfeito.roll(8)
			jogoPerfeito.roll(2)
			jogoPerfeito.roll(9)
			jogoPerfeito.roll(1)
			jogoPerfeito.roll(9)
			jogoPerfeito.roll(1)
			jogoPerfeito.roll(10)
			
			expect(jogoPerfeito.score).to eq 120
		end
	end

	context '#roll' do
		it "Exemplo de um determinado jogo ao fim de 4 lançamentos" do
			jogoPerfeito.roll(10)
			jogoPerfeito.roll(10)
			jogoPerfeito.roll(9)
			jogoPerfeito.roll(0)
			
			expect(jogoPerfeito.score).to eq 57
		end
	end

	context '#score' do
		it "Apresentar o score antes de iniciar o jogo" do			
			expect(jogoPerfeito.score).to eq 0
		end
	end
end