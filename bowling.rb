class Bowling
	attr_accessor :pontuacao
	attr_accessor :totalPontos, :jogada, :pinos, :jogadaExtra

	def initialize
		@pontuacao = { }
		for i in 1..10
   			pontuacao[i] = Rodada.new

   			@totalPontos = 0
			@jogada = 1
			@pinos = 10
			@jogadaExtra = false
		end
	end

	def roll(pins)
		# roll the desired number of pins
		if jogada == 1
			if pontuacao[1].tentativa1 == nil
				pontuacao[1].tentativa1 = pins
				pontuacao[1].pontos = pins
				@totalPontos += pins

				if pins == 10
					pontuacao[1].estado = "strike"
					pontuacao[1].bonus = 2
					@jogada += 1
				else
					@pinos -= pins
				end
			else
				pontuacao[1].tentativa2 = pins
				pontuacao[1].pontos += pins
				@totalPontos += pins

				if pins == @pinos
					pontuacao[1].estado = "spare"
					pontuacao[1].bonus = 1
				end
				@pinos = 10
				@jogada += 1
			end
		
		elsif jogada == 2
			if pontuacao[1].bonus > 0
				pontuacao[1].pontos += pins
				@totalPontos += pins
				pontuacao[1].bonus -= 1
			end

			if pontuacao[2].tentativa1 == nil
				pontuacao[2].tentativa1 = pins
				@totalPontos += pins
				pontuacao[2].pontos = totalPontos

				if pins == 10
					pontuacao[2].estado = "strike"
					pontuacao[2].bonus = 2
					@jogada += 1
				else
					@pinos -= pins
				end
			else
				pontuacao[2].tentativa2 = pins
				@totalPontos += pins
				pontuacao[2].pontos = totalPontos

				if pins == @pinos
					pontuacao[2].estado = "spare"
					pontuacao[2].bonus = 1
				end
				@pinos = 10
				@jogada += 1
			end
		
		elsif jogada <= 9
			if pontuacao[jogada - 2].bonus > 0
				pontuacao[jogada - 2].pontos += pins
				@totalPontos += pins
				pontuacao[jogada - 2].bonus -= 1
				pontuacao[jogada - 1].pontos += pins
			end
			if pontuacao[jogada - 1].bonus > 0
				pontuacao[jogada - 1].pontos += pins
				@totalPontos += pins
				pontuacao[jogada - 1].bonus -= 1
			end

			if pontuacao[jogada].tentativa1 == nil
				pontuacao[jogada].tentativa1 = pins
				@totalPontos += pins
				pontuacao[jogada].pontos = totalPontos

				if pins == 10
					pontuacao[jogada].estado = "strike"
					pontuacao[jogada].bonus = 2
					@jogada += 1
				else
					@pinos -= pins
				end
			else
				pontuacao[jogada].tentativa2 = pins
				@totalPontos += pins
				pontuacao[jogada].pontos = totalPontos

				if pins == @pinos
					pontuacao[jogada].estado = "spare"
					pontuacao[jogada].bonus = 1
				end
				@pinos = 10
				@jogada += 1
			end
		
		elsif jogada == 10
			if pontuacao[jogada - 2].bonus > 0
				pontuacao[jogada - 2].pontos += pins
				@totalPontos += pins
				pontuacao[jogada - 2].bonus -= 1
				pontuacao[jogada - 1].pontos += pins
			end
			if pontuacao[jogada - 1].bonus > 0
				pontuacao[jogada - 1].pontos += pins
				@totalPontos += pins
				pontuacao[jogada - 1].bonus -= 1
			end

			if pontuacao[jogada].tentativa1 == nil
				pontuacao[jogada].tentativa1 = pins
				@totalPontos += pins
				pontuacao[jogada].pontos = totalPontos

				if pins == 10
					pontuacao[jogada].estado = "strike"
					@jogadaExtra = true
				else
					@pinos -= pins
				end
			elsif pontuacao[jogada].tentativa2 == nil
				pontuacao[jogada].tentativa2 = pins
				@totalPontos += pins
				pontuacao[jogada].pontos = totalPontos

				if pins == @pinos
					if pontuacao[jogada].estado == nil
						pontuacao[jogada].estado = "spare"
					end
					@jogadaExtra = true
					@pinos = 10
				else
					if jogadaExtra
						@pinos -= pins
					else
						@jogada += 1
						puts totalPontos
					end
				end
			elsif @jogadaExtra == true
				pontuacao[jogada].tentativa3 = pins
				@totalPontos += pins
				pontuacao[jogada].pontos = totalPontos
				@jogada += 1
			end
		end
	end

	def score
		totalPontos
	end

	def scoreDetalhado
		# return the current score
		puts
		puts "+-------------------------------------------------------------+"
		puts "|  1  |  2  |  3  |  4  |  5  |  6  |  7  |  8  |  9  |  10   |"
		puts "+-------------------------------------------------------------+"
		puts "| #{aux(1,1)} #{aux(1,2)} | #{aux(2,1)} #{aux(2,2)} | #{aux(3,1)} #{aux(3,2)} | #{aux(4,1)} #{aux(4,2)} | #{aux(5,1)} #{aux(5,2)} | #{aux(6,1)} #{aux(6,2)} | #{aux(7,1)} #{aux(7,2)} | #{aux(8,1)} #{aux(8,2)} | #{aux(9,1)} #{aux(9,2)} | #{aux(10,1)} #{aux(10,2)} #{aux(10,3)} |"
		puts "+-------------------------------------------------------------+"
		puts "|#{aux2(1)}|#{aux2(2)}|#{aux2(3)}|#{aux2(4)}|#{aux2(5)}|#{aux2(6)}|#{aux2(7)}|#{aux2(8)}|#{aux2(9)}| #{aux2(10)} |"
		puts "+-------------------------------------------------------------+"
		puts
		if score == 1
			puts "Neste momento, o score é de #{score} ponto"
		else
			puts "Neste momento, o score é de #{score} pontos"
		end
	end

	def aux (a, b)
		if b == 1
			if pontuacao[a].tentativa1 == nil
				" "
			elsif pontuacao[a].tentativa1 == 10
				"X"
			else
				pontuacao[a].tentativa1
			end
		elsif b == 2
			if pontuacao[a].tentativa2 == nil
				" "
			elsif pontuacao[a].estado == "spare"
				"/"
			elsif pontuacao[a].tentativa2 == 10
				"X"
			else
				pontuacao[a].tentativa2
			end
		else
			if pontuacao[a].tentativa3 == nil
				" "
			elsif pontuacao[a].tentativa3 == 10
				"X"
			else
				if (pontuacao[a].tentativa2 + pontuacao[a].tentativa3) == 10
					"/"
				else
					pontuacao[a].tentativa3
				end
			end
		end		
	end

	def aux2 (r)
		if pontuacao[r].pontos == nil
			"     "
		elsif pontuacao[r].pontos < 10
			"  #{pontuacao[r].pontos}  "
		elsif pontuacao[r].pontos < 100
			" #{pontuacao[r].pontos}  "
		else
			" #{pontuacao[r].pontos} "
		end
	end
end

class Rodada
	attr_accessor :tentativa1, :tentativa2, :tentativa3, :pontos, :estado, :bonus

	def initialize
		@tentativa1 = nil
		@tentativa2 = nil
		@tentativa3 = nil
		@pontos = nil
		@estado = nil
		@bonus = 0
	end
end



=begin

	# Para testes, correr a classe 'Testes'

	class Testes
		# Simulação do jogo PERFEITO

		puts
		puts "Simulação do jogo PERFEITO"

		jogo2 = Bowling.new
		jogo2.roll(10)
		jogo2.roll(10)
		jogo2.roll(10)
		jogo2.roll(10)
		jogo2.roll(10)
		jogo2.roll(10)
		jogo2.roll(10)
		jogo2.roll(10)
		jogo2.roll(10)
		jogo2.roll(10)
		jogo2.roll(10)
		jogo2.roll(10)
		jogo2.scoreDetalhado


		# Simulação do jogo exemplo detalhadamente

		puts
		puts "==============================================================="
		puts
		puts
		puts "Simulação do jogo exemplo detalhadamente"

		jogo = Bowling.new
		jogo.roll(1)
		jogo.scoreDetalhado
		jogo.roll(4)
		jogo.scoreDetalhado
		jogo.roll(4)
		jogo.scoreDetalhado
		jogo.roll(5)
		jogo.scoreDetalhado
		jogo.roll(6)
		jogo.scoreDetalhado
		jogo.roll(4)
		jogo.scoreDetalhado
		jogo.roll(5)
		jogo.scoreDetalhado
		jogo.roll(5)
		jogo.scoreDetalhado
		jogo.roll(10)
		jogo.scoreDetalhado
		jogo.roll(0)
		jogo.scoreDetalhado
		jogo.roll(1)
		jogo.scoreDetalhado
		jogo.roll(7)
		jogo.scoreDetalhado
		jogo.roll(3)
		jogo.scoreDetalhado
		jogo.roll(6)
		jogo.scoreDetalhado
		jogo.roll(4)
		jogo.scoreDetalhado
		jogo.roll(10)
		jogo.scoreDetalhado
		jogo.roll(2)
		jogo.scoreDetalhado
		jogo.roll(8)
		jogo.scoreDetalhado
		jogo.roll(6)
		jogo.scoreDetalhado
	end

=end