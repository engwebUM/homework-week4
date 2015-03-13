class Bowling_error

	def isnumeric(pins)
		 return   raise unless pins.is_a?(Numeric)
	end

	def numberpins (pins)
		if(pins>10 || pins <0)
      	return	raise ArgumentError, 'Number pins incorrect'
    	end
	end


	def pinlarge(pins)
		if pins>10
		return raise ArgumentError, 'Number pins too large'
		end
	end

	

end
