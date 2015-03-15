class Bowling
	attr_accessor :frame_score, :full_points, :move, :pins, :move_bonus

	def initialize
		@frame_score = { }
		for frame in 1..10
   			frame_score[frame] = Frame.new
   			@full_points = 0
			@move = 1
			@pins = 10
			@move_bonus = false
		end
	end

	def roll(pins)
		if move == 1
			add_points(pins)		
		elsif move == 2
			add_bonus(pins, 1)
			add_points(pins)		
		elsif move <= 9
			add_bonus(pins, 2)
			add_points(pins)		
		elsif move == 10
			add_bonus(pins, 2)
			if frame_score[move].try1 == nil
				tries(1, pins)
				if pins == 10
					frame_score[move].status = "strike"
					@move_bonus = true
				else
					@pins -= pins
				end
			elsif frame_score[move].try2 == nil
				tries(2, pins)
				if pins == @pins
					if frame_score[move].status == nil
						frame_score[move].status = "spare"
					end
					@move_bonus = true
					@pins = 10
				else
					if move_bonus
						@pins -= pins
					else
						@move += 1
						puts full_points
					end
				end
			elsif @move_bonus == true
				tries(3, pins)
				@move += 1
			end
		end
	end

	def add_bonus(pins, bonus)
		if bonus == 2
			if frame_score[move - 2].bonus > 0
				frame_score[move - 2].points += pins
				@full_points += pins
				frame_score[move - 2].bonus -= 1
				frame_score[move - 1].points += pins
			end
		end
		if frame_score[move - 1].bonus > 0
			frame_score[move - 1].points += pins
			@full_points += pins
			frame_score[move - 1].bonus -= 1
		end
	end

	def add_points(pins)
		if frame_score[move].try1 == nil
			tries(1, pins)
			if pins == 10
				frame_score[move].status = "strike"
				frame_score[move].bonus = 2
				@move += 1
			else
				@pins -= pins
			end
		else
			tries(2, pins)
			if pins == @pins
				frame_score[move].status = "spare"
				frame_score[move].bonus = 1
			end
			@pins = 10
			@move += 1
		end
	end

	def tries(try, pins)
		if try == 1
			frame_score[move].try1 = pins
		elsif try == 2
			frame_score[move].try2 = pins
		else
			frame_score[move].try3 = pins
		end
		@full_points += pins
		frame_score[move].points = full_points
	end

	def score
		full_points
	end

	def detailed_score
		puts "\n+-------------------------------------------------------------+"
		puts "|  1  |  2  |  3  |  4  |  5  |  6  |  7  |  8  |  9  |  10   |"
		puts "+-------------------------------------------------------------+"
		puts "| #{points(1,1)} #{points(1,2)} | #{points(2,1)} #{points(2,2)} | #{points(3,1)} #{points(3,2)} | #{points(4,1)} #{points(4,2)} | #{points(5,1)} #{points(5,2)} | #{points(6,1)} #{points(6,2)} | #{points(7,1)} #{points(7,2)} | #{points(8,1)} #{points(8,2)} | #{points(9,1)} #{points(9,2)} | #{points(10,1)} #{points(10,2)} #{points(10,3)} |"
		puts "+-------------------------------------------------------------+"
		puts "|#{points_frame(1)}|#{points_frame(2)}|#{points_frame(3)}|#{points_frame(4)}|#{points_frame(5)}|#{points_frame(6)}|#{points_frame(7)}|#{points_frame(8)}|#{points_frame(9)}| #{points_frame(10)} |"
		puts "+-------------------------------------------------------------+"
		puts
		if score == 1
			puts "At this point, the score is 1 point"
		else
			puts "At this point, the score is #{score} points"
		end
	end

	def points (move, try)
		if try == 1
			if frame_score[move].try1 == nil
				" "
			elsif frame_score[move].try1 == 10
				"X"
			else
				frame_score[move].try1
			end
		elsif try == 2
			if frame_score[move].try2 == nil
				" "
			elsif frame_score[move].status == "spare"
				"/"
			elsif frame_score[move].try2 == 10
				"X"
			else
				frame_score[move].try2
			end
		else
			if frame_score[move].try3 == nil
				" "
			elsif frame_score[move].try3 == 10
				"X"
			else
				if (frame_score[move].try2 + frame_score[move].try3) == 10
					"/"
				else
					frame_score[move].try3
				end
			end
		end		
	end

	def points_frame (frame)
		if frame_score[frame].points == nil
			"     "
		elsif frame_score[frame].points < 10
			"  #{frame_score[frame].points}  "
		elsif frame_score[frame].points < 100
			" #{frame_score[frame].points}  "
		else
			" #{frame_score[frame].points} "
		end
	end
end

class Frame
	attr_accessor :try1, :try2, :try3, :points, :status, :bonus

	def initialize
		@try1 = nil
		@try2 = nil
		@try3 = nil
		@points = nil
		@status = nil
		@bonus = 0
	end
end

=begin
	# To test, run the 'Tests' class
	class Tests
		# PERFECT game simulation
		puts
		puts "PERFECT game simulation"
		game = Bowling.new
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
		game.detailed_score

		# Game simulation example in detail
		puts
		puts "==============================================================="
		puts
		puts
		puts "Game simulation example in detail"
		game2 = Bowling.new
		game2.roll(1)
		game2.detailed_score
		game2.roll(4)
		game2.detailed_score
		game2.roll(4)
		game2.detailed_score
		game2.roll(5)
		game2.detailed_score
		game2.roll(6)
		game2.detailed_score
		game2.roll(4)
		game2.detailed_score
		game2.roll(5)
		game2.detailed_score
		game2.roll(5)
		game2.detailed_score
		game2.roll(10)
		game2.detailed_score
		game2.roll(0)
		game2.detailed_score
		game2.roll(1)
		game2.detailed_score
		game2.roll(7)
		game2.detailed_score
		game2.roll(3)
		game2.detailed_score
		game2.roll(6)
		game2.detailed_score
		game2.roll(4)
		game2.detailed_score
		game2.roll(10)
		game2.detailed_score
		game2.roll(2)
		game2.detailed_score
		game2.roll(8)
		game2.detailed_score
		game2.roll(6)
		game2.detailed_score
	end
=end