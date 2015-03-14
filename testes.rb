class Testes
	attr_accessor :a
	attr_accessor :b

	def initialize (a,b)
		@a=a
		@b=b
	end


end


teste = Testes.new(1,2)
#teste.a=3
p teste.a