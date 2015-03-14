class Bowling

	attr_reader :game
	attr_reader :frame
	attr_reader :rolls

	def initialize ()
		@game = Array.new
		@first_roll = -1
		@second_roll = 0
		@frame = 0
		@rolls = 0
		@valid_roll= 0
	end 

	def roll(pins)
		if (@valid_roll != -1) then
			@valid_roll = 0
			#preserved invariants: 1, 2), 3) e 4)
			if pins<=10 and pins>=0 and @frame>=10 and @frame<12 and (@game.last=='strike' or (@game.take (@game.size-1)).last=='strike')
			then
				@valid_roll =1
				if (pins==10) then @game[@rolls] = 'strike' else @game[@rolls]=pins end
				@frame += 1
				@rolls += 1	
			end

			#preserved invariants: 1), 2), 3) e 5)
			if pins<=10 and pins>=0 and @frame==10 and @game.last=='spare'
			then
				@valid_roll =1
				if (pins==10) then @game[@rolls] = 'strike' else @game[@rolls]=pins end
				@frame += 1
				@rolls += 1
			end 

			#preserved invariants: 1) 2) 3)
			if pins<=10 and pins>=0 and @frame<10
			then 
				@valid_roll =1
				add_roll(pins)
			end	

			if @valid_roll==0 then @valid_roll=-1 end
	 	end
	end

	def score
		position = 0
		frame = 1
		total=0
		even = 0
		@game.each do |roll|
			# invariant 7)
			if roll =='strike'
			then
				if @game[position+1]!= nil and @game[position+2]!=nil and frame<10
				then 
					total += 10 + score_aux(position+1) + score_aux(position+2)
					even=0
				else 
					total += 10
					even=0
				end 
				position += 1
				frame += 1
			end
			# invariant 8)
			if roll =='spare'
			then
				if @game[position+1]!=nil and frame<10
				then 
					total += (10-@game[position-1]) + score_aux(position+1)
					even=0
				else 
					total+=(10-@game[position-1])
					even=0
				end 
				position += 1
			end
			#non strike or spare cases
			if roll.is_a? Numeric and even==0 then total += roll; position +=1; end 
			if roll.is_a? Numeric and even==1 then total += roll; position +=1; frame+=1; even=-1 end 
			even += 1;			
		end
		total
	end

	# add_roll method preserve invariant 6)
	def add_roll (pins)
		if@valid_roll != -1 then
			@valid_roll=0
			#first_roll
				#strike case
			if @first_roll==-1 and pins==10 and @second_roll.even?
			then
				@game[@rolls]= 'strike'
				@rolls += 1 
				@frame += 1
				@valid_roll=1
			end
				#is not strike case
			if @first_roll == -1 and pins<10 and @second_roll.even?
			then 
				@game[@rolls]= pins
				@first_roll = pins
				@rolls += 1
				@valid_roll=1
			end 

			#second_roll		
				#spare case
			if @first_roll!=-1 and @first_roll+pins==10 and !@second_roll.even?
			then 
				@game[@rolls]='spare'
				@rolls += 1
				@frame += 1
				@first_roll = -1
				@valid_roll=1
			end 
				#is not spare case or strike case
			if @first_roll!=-1 and @first_roll+pins<10 and !@second_roll.even?
			then 
				@game[@rolls]=pins
				@rolls +=1
				@frame += 1
				@first_roll = -1
				@valid_roll=1
			end 
				# invariant 6)
			if@firlst_roll!=1 and @first_roll+pins>10 and !@second_roll.even? then @valid_roll = -1 end

			#second_roll increment
			if pins==10 then @second_roll += 2 else @second_roll+=1 end
			if @valid_roll==0 then @valid_roll=-1 end
		end
	end		


	def score_aux (position)
		if @game[position]=='strike' then return 10 end
		if @game[position]=='spare' then return 10-score_aux(position-1) end
		if @game[position].is_a? Numeric then return @game[position] end
	end
end