class Jogada
	attr_accessor:first_game, :second_game, :points, :strike, :spare

	def initialize(first_game,strike,spare)
		@first_game = first_game 
		@second_game = 0
		@points = 0
		@strike = strike
		@spare = spare		
	end					
end