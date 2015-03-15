class Ball
	def normal
		puts "normal ball"
	end

	def fast
		puts "fast ball"
	end
end

class NormalPlayer
	def roll
		@ball.normal
	end
end

class ProfessionalPlayer
	def roll
		@ball.fast
	end
end