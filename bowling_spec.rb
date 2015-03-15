require_relative './bowling'
require 'rspec'


 
RSpec.describe Bowling do
  before do
    @jogo = Bowling.new
  end
  
  context '#roll' do
  
    it 'TESTE: primeiro roll acerta 3 pinos' do
      expect(@jogo.roll(3)).to match [3]
    end
    
    it 'TESTE: STRIKE' do
      expect(@jogo.roll(10)).to match [10,0]
    end
    
    it 'TESTE: STRIKE após cenas' do
      @jogo.roll(3)
      @jogo.roll(3)
      expect(@jogo.roll(10)).to match [3,3,10,0]
    end
    
    it 'TESTE: 1 roll após STRIKE após cenas' do
      @jogo.roll(3)
      @jogo.roll(3)
      @jogo.roll(10)
      expect(@jogo.roll(2)).to match [3,3,10,0,2]
    end
    
    it 'TESTE: cenas após STRIKE após cenas' do
      @jogo.roll(3)
      @jogo.roll(3)
      @jogo.roll(10)
      @jogo.roll(5)
      @jogo.roll(3)
      expect(@jogo.plays).to match [3,3,10,0,5,3]
    end
    
    it 'TESTE: cenas após SPARE após cenas' do
      @jogo.roll(3)
      @jogo.roll(3)
      @jogo.roll(7)
      @jogo.roll(3)
      @jogo.roll(5)
      @jogo.roll(3)
      expect(@jogo.plays).to match [3,3,7,3,5,3]
    end
    
    it 'TESTE: jogo completo sempre 10' do
      @jogo.roll(10)
      @jogo.roll(10)
      @jogo.roll(10)
      @jogo.roll(10)
      @jogo.roll(10)
      @jogo.roll(10)
      @jogo.roll(10)
      @jogo.roll(10)
      @jogo.roll(10)
      @jogo.roll(10)
      @jogo.roll(10)
      @jogo.roll(10)
      expect(@jogo.plays).to eq [10,0,10,0,10,0,10,0,10,0,10,0,10,0,10,0,10,0,10,0,10,0,10,0]
    end
    
    it 'ERRO: STRIKE após 1 roll' do
      @jogo.roll(3)
      expect{@jogo.roll(10)}.to raise_error (ArgumentError)
    end
    
    it 'ERRO: 1 roll com mais de 10 pinos' do
      expect{@jogo.roll(12)}.to raise_error (ArgumentError)
    end
    
    it 'ERRO: 1 roll com mais de 10 pinos - com 1 roll antes' do
      @jogo.roll(7)
      expect{@jogo.roll(12)}.to raise_error (ArgumentError)
    end
    
    it 'ERRO: 1 roll com mais de 10 pinos - com 2 roll antes' do
      @jogo.roll(7)
      @jogo.roll(1)
      expect{@jogo.roll(12)}.to raise_error (ArgumentError)
    end
    
    it 'ERRO: 2 roll com soma maior que 10 pinos' do
      @jogo.roll(7)
      expect{@jogo.roll(4)}.to raise_error (ArgumentError)
    end
    
    it 'ERRO: roll com menos de 0 pinos' do
      expect{@jogo.roll(-1)}.to raise_error (ArgumentError)
    end
    
    it 'ERRO: 2o roll com menos de 0 pinos' do
      @jogo.roll(7)
      expect{@jogo.roll(-1)}.to raise_error (ArgumentError)
    end
    
    it 'TESTE: jogo completo sempre 2,3' do
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)      
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)      
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)
      expect(@jogo.plays).to eq [2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3]
    end
    
    it 'ERRO: jogo completo sempre 2,3 e 2 a mais no fim' do
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)      
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)      
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)
      expect{@jogo.roll(2)}.to raise_error (ArgumentError)
    end
    
    it 'TESTE: jogo completo sempre 2,3 e a acabar em spare + 1 ' do
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)      
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)      
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(8)      
      @jogo.roll(1)
      expect(@jogo.plays).to eq [2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,8,1]
      # expect{@jogo.roll(2)}.to raise_error (ArgumentError)
    end
    
    it 'TESTE: jogo completo sempre 2,3 e a acabar em spare + 10 ' do
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)      
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)      
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(8)      
      @jogo.roll(10)
      expect(@jogo.plays).to eq [2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,8,10,0]
      # expect{@jogo.roll(2)}.to raise_error (ArgumentError)
    end
    
    it 'ERRO: jogo completo sempre 2,3 e a acabar em spare + 1 + 1 ' do
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)      
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)      
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(8)      
      @jogo.roll(1)
      expect{@jogo.roll(1)}.to raise_error (ArgumentError)
    end
    
    it 'ERRO: jogo completo sempre 2,3 e a acabar em spare + 10 + 1 ' do
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)      
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)      
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(8)      
      @jogo.roll(10)
      expect{@jogo.roll(1)}.to raise_error (ArgumentError)
    end  
    
    it 'TESTE: jogo completo sempre 2,3 e a acabar em strike + 1 + 1 ' do
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)      
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)      
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(10)      
      @jogo.roll(1)      
      @jogo.roll(1)
      expect(@jogo.plays).to eq [2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,10,0,1,1]
    end
    
    it 'TESTE: jogo completo sempre 2,3 e a acabar em strike + 10 + 1 ' do
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)      
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)      
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(10)      
      @jogo.roll(10)      
      @jogo.roll(1)
      expect(@jogo.plays).to eq [2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,10,0,10,0,1]
    end
     
    it 'TESTE: jogo completo sempre 2,3 e a acabar em strike + 10 + 10 ' do
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)      
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)      
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(10)      
      @jogo.roll(10)      
      @jogo.roll(10)
      expect(@jogo.plays).to eq [2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,2,3,10,0,10,0,10,0]
    end
    
    it 'ERRO: jogo completo sempre 2,3 e a acabar em strike + 1 + 1 + 1 ' do
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)      
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)      
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(10)      
      @jogo.roll(1)      
      @jogo.roll(1)
      expect{@jogo.roll(1)}.to raise_error (ArgumentError)
    end     
  
  end
    
  context '#score' do
  
    it 'TESTE: 1 plays de 0' do
      expect(@jogo.score).to eq 0
    end
  
    it 'TESTE: 1 plays de 0' do
      @jogo.roll(0)
      expect(@jogo.score).to eq 0
    end
  
    it 'TESTE: 1 plays de 3' do
      @jogo.roll(3)
      expect(@jogo.score).to eq 3
    end
  
    it 'TESTE: 2 plays de 3' do
      @jogo.roll(3)
      @jogo.roll(3)
      expect(@jogo.score).to eq 6
    end
    
    it 'TESTE: 3 plays diferentes' do
      @jogo.roll(3)
      @jogo.roll(2)
      @jogo.roll(1)
      expect(@jogo.score).to eq 6
    end
    
    it 'TESTE: 6 plays de 3' do
      @jogo.roll(3)
      @jogo.roll(3)
      @jogo.roll(3)
      @jogo.roll(3)
      @jogo.roll(3)
      @jogo.roll(3)
      expect(@jogo.score).to eq 18
    end  
    
    it 'TESTE: 6 plays de 0' do
      @jogo.roll(0)
      @jogo.roll(0)
      @jogo.roll(0)
      @jogo.roll(0)
      @jogo.roll(0)
      @jogo.roll(0)
      expect(@jogo.score).to eq 0
    end
    
    it 'TESTE: 1 frame após STRIKE após 1 frame' do
      @jogo.roll(2)
      @jogo.roll(3)
      @jogo.roll(10)
      @jogo.roll(2)
      @jogo.roll(3)
      expect(@jogo.score).to eq 25
    end
    
    it 'TESTE: outro - 1 frame após STRIKE após 1 frame' do
      @jogo.roll(1)
      @jogo.roll(1)
      @jogo.roll(10)
      @jogo.roll(1)
      @jogo.roll(1)
      expect(@jogo.score).to eq 16
    end
    
    it 'TESTE: STRIKE após 1 frame' do
      @jogo.roll(2)
      @jogo.roll(3)
      @jogo.roll(10)
      expect(@jogo.score).to eq 15
    end
    
    it 'TESTE: 1 roll de 0 após STRIKE após 1 frame' do
      @jogo.roll(2)
      @jogo.roll(3)
      @jogo.roll(10)
      @jogo.roll(0)
      expect(@jogo.score).to eq 15
    end
    
    it 'TESTE: 1 roll de 1 após STRIKE após 1 frame' do
      @jogo.roll(2)
      @jogo.roll(3)
      @jogo.roll(10)
      @jogo.roll(1)
      expect(@jogo.score).to eq 17
    end
  
    it 'TESTE: jogo completo sempre 2 e 3' do
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)      
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)      
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)
      @jogo.roll(2)      
      @jogo.roll(3)
      expect(@jogo.score).to eq 50
    end
  
    it 'TESTE: 1 roll de 0 e um de 1 após 2 STRIKES seguidos' do
      @jogo.roll(10)
      @jogo.roll(10)
      @jogo.roll(1)
      @jogo.roll(0)
      expect(@jogo.score).to eq 33
    end
  
    it 'TESTE: jogo completo sempre 10' do
      @jogo.roll(10)
      @jogo.roll(10)
      @jogo.roll(10)
      @jogo.roll(10)
      @jogo.roll(10)
      @jogo.roll(10)
      @jogo.roll(10)
      @jogo.roll(10)
      @jogo.roll(10)
      @jogo.roll(10)
      @jogo.roll(10)
      @jogo.roll(10)
      expect(@jogo.score).to eq 300
    end
    
  end

end
