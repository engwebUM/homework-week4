class Teste1
	attr_accessor :a
	attr_accessor :b

	def initialize (a,b)
		@a=a
		@b=b
	end

	def adiciona
		teste2 = Teste2.new(self) 
		teste2.adiciona
	end
end



class Teste2
	def initialize (teste)
		@teste1=teste
	end

	def adiciona 
		@teste1.a << 5
	end
end


teste1 = Teste1.new([1,2,3,4],2)
teste1.adiciona


p teste1.a
