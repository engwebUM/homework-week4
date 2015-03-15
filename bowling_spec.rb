require_relative './bowling'
require 'rspec'

def num_lauch(n, pins)
     n.times do
     b.roll(pins)
     end
end
 
RSpec.describe Bowling do

let (:b) {b = Bowling.new}
	context '#roll' do
		it 'perfect game - 12 STRIKES(X)' do
		    num_lauch(12, 10)
		    expect(b.score).to eq 300
		end
	    
	end
	context '#score' do

		it "ones in the game" do
			num_lauch(20, 1)
			expect(b.score).to eq 20
		end
		it "spare " do
			b.roll(5)
		    b.roll(5) 
		    b.roll(3)
		    num_lauch(17, 0)
		    expect(b.score).to eq 16
		end
		it "just one spare" do
			b.roll(5)
			b.roll(5)
			num_lauch(18, 0)
			expect(b.score).to eq 10
		end

		it "7 point in the frist time" do
			b.roll(7)
			num_lauch(19, 0)
			expect(b.score).to eq 7
		end
		it 'spare + 3 points in the next ball' do
			b.roll(6)
			b.roll(4)
		    b.roll(3)
		    num_lauch(17, 0)
		end
		it "Too bad" do
		    num_lauch(20, 0)
		    expect(b.score).to eq 0
		end
		it 'strike in the frist ball' do
		    b.roll(10)  
		    b.roll(3)
		    b.roll(4)
		    num_lauch(17, 0)
		    expect(b.score).to eq 24
		end
		it 'perfect game - 12 STRIKES(X)' do
		    num_lauch(12, 10)
		    expect(b.score).to eq 300
		end
		it 'strike + [3,2]+strike+[6,spare]' do
		    b.roll(10)  
		    b.roll(3)
		    b.roll(2)
		    b.roll(10)
		    b.roll(6)
		    b.roll(4)
		    num_lauch(14, 0)
		    expect(b.score).to eq 50
		end

		it 'double strike + double spare' do
		    b.roll(10)
		    b.roll(10)
		    b.roll(4)
		    b.roll(6)
		    b.roll(9)
		    b.roll(1)
		    num_lauch(14, 0)
		    expect(b.score).to eq 73
		end
		it 'double strike + doubsle spare' do
		    b.roll(9)
		    b.roll(1)
		    b.roll(2)
		    b.roll(8)
		    b.roll(5)
		    b.roll(5)
		    b.roll(5)
		    b.roll(5)
		    num_lauch(12, 0)
		    expect(b.score).to eq 52
		end

		it '5 strikes(X) + 4 spares(/) + strike + 4 + spare' do
		    b.roll(10)
		    b.roll(10)
		    b.roll(10)
		    b.roll(10)
		    b.roll(10)
		    b.roll(7)
		    b.roll(3)
		    b.roll(8)
		    b.roll(2)
		    b.roll(4)
		    b.roll(6)
		    b.roll(5)
		    b.roll(5)
		    b.roll(10)
		    b.roll(4)
		    b.roll(6)
		    expect(b.score).to eq 224
		end
		it '5 strikes(X) + 4 spares(/) + spare + 5' do
		    b.roll(10)
		    b.roll(10)
		    b.roll(10)
		    b.roll(10)
		    b.roll(10)
		    b.roll(7)
		    b.roll(3)
		    b.roll(8)
		    b.roll(2)
		    b.roll(4)
		    b.roll(6)
		    b.roll(5)
		    b.roll(5)
		    b.roll(8)
		    b.roll(2)
		    b.roll(5)
		    expect(b.score).to eq 217
		end

	end
end



