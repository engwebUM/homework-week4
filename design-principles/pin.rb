class Pin
	attr_reader :height

	def initialize height 
		@height = height
	end

	def adjust_height define_height
		@height += define_height
	end
end

pin = Pin.new 20 
pin.adjust_height 10 
puts pin.height
puts 

class PinColor < Pin
	attr_reader :color

	def initialize height, color 
		@height, @color = height, color
	end
end

pinColor = PinColor.new 20, "red" 
pinColor.adjust_height 10
puts pinColor.height
puts pinColor.color