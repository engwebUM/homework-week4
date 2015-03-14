class Ball
	def normal
		puts "normal ball"
	end
end

class ProBall
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
		@pro_ball.fast
	end
end