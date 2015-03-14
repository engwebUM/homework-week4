require_relative './bowling'
require 'rspec'

RSpec.describe Bowling do
  context '#roll' do
  	
  	it "says that you entered an invalid number of pins" do
  		b1=Bowling.new
	    	b1.roll(10)
			b1.roll(7)
			b1.roll(2)
			b1.roll(10)
			b1.roll(10)
			expect{b1.roll(100)}.to raise_error
  	end

  	it "says that you entered an invalid number of pins" do
  		b1=Bowling.new
	    	b1.roll(10)
			b1.roll(7)
			b1.roll(2)
			b1.roll(10)
			b1.roll(10)
			expect{b1.roll(-1)}.to raise_error
  	end

  	it "goes all normal" do
	    	b1=Bowling.new
	    	b1.roll(10)
			b1.roll(10)
			b1.roll(10)
			b1.roll(10)
			b1.roll(10)
			b1.roll(10)
			b1.roll(10)
			b1.roll(10)
			b1.roll(10)
			b1.roll(10)
			b1.roll(10)
			b1.roll(10)
			b1.roll(10)
			b1.roll(10)
			b1.roll(10)
			b1.roll(10)
			expect{b1.roll(10)}.not_to raise_error
    	end

  end

  context '#score' do

  	#Incomplete Games
  	it "returns 28" do
	    	b1=Bowling.new
	    	b1.roll(10)
			b1.roll(7)
			b1.roll(2)
			expect(b1.score).to eq(28)
    end

    it "returns 58" do
	    	b1=Bowling.new
	    	b1.roll(10)
			b1.roll(7)
			b1.roll(2)
			b1.roll(10)
			b1.roll(10)
			expect(b1.score).to eq(58)
    end

    it "returns 46" do
	    	b1=Bowling.new
	    	b1.roll(10)
			b1.roll(7)
			b1.roll(2)#28
			b1.roll(2)
			b1.roll(2)
			b1.roll(2)
			b1.roll(2)
			b1.roll(8)
			b1.roll(2)
			expect(b1.score).to eq(46)
    end

    it "returns 72" do
	    	b1=Bowling.new
	    	b1.roll(10)
			b1.roll(7)
			b1.roll(3)#28
			b1.roll(2)
			b1.roll(5)
			b1.roll(2)
			b1.roll(3)
			b1.roll(8)
			b1.roll(2)
			b1.roll(10)
			expect(b1.score).to eq(74)
    end


  	#Complete games
  	it "returns 300" do
	    	b1=Bowling.new
	    	b1.roll(10)
			b1.roll(10)
			b1.roll(10)
			b1.roll(10)
			b1.roll(10)
			b1.roll(10)
			b1.roll(10)
			b1.roll(10)
			b1.roll(10)
			b1.roll(10)
			b1.roll(10)
			b1.roll(10)
			b1.roll(10)
			b1.roll(10)
			b1.roll(10)
			b1.roll(10)
			b1.roll(10)
			expect(b1.score).to eq(300)
    	end
	
	it "returns 0" do
	    	b1=Bowling.new
	    	b1.roll(0)
			b1.roll(0)
			b1.roll(0)
			b1.roll(0)
			b1.roll(0)
			b1.roll(0)
			b1.roll(0)
			b1.roll(0)
			b1.roll(0)
			b1.roll(0)
			b1.roll(0)
			b1.roll(0)
			b1.roll(0)
			b1.roll(0)
			b1.roll(0)
			b1.roll(0)
			b1.roll(0)
			expect(b1.score).to eq(0)
    	end

    	it "returns 82" do
	    	b1=Bowling.new
	    	b1.roll(9)
			b1.roll(0)
			b1.roll(3)
			b1.roll(5)
			b1.roll(6)
			b1.roll(1)
			b1.roll(3)
			b1.roll(6)
			b1.roll(8)
			b1.roll(1)
			b1.roll(5)
			b1.roll(3)
			b1.roll(2)
			b1.roll(5)
			b1.roll(8)
			b1.roll(0)
			b1.roll(7)
			b1.roll(1)
			b1.roll(8)
			b1.roll(1)
			expect(b1.score).to eq(82)
    	end

    	it "returns 131" do
	    	b1=Bowling.new
	    	b1.roll(9)
			b1.roll(0)
			b1.roll(3)
			b1.roll(7)
			b1.roll(6)
			b1.roll(1)
			b1.roll(3)
			b1.roll(7)
			b1.roll(8)
			b1.roll(1)
			b1.roll(5)
			b1.roll(5)
			b1.roll(0)
			b1.roll(10)
			b1.roll(8)
			b1.roll(0)
			b1.roll(7)
			b1.roll(3)
			b1.roll(8)
			b1.roll(2)
			b1.roll(8)
			expect(b1.score).to eq(131)
    	end

    	it "returns 193" do
	    	b1=Bowling.new
	    	b1.roll(10)
			b1.roll(3)
			b1.roll(7)
			b1.roll(6)
			b1.roll(1)
			b1.roll(10)
			b1.roll(10)
			b1.roll(10)
			b1.roll(2)
			b1.roll(8)
			b1.roll(9)
			b1.roll(0)
			b1.roll(7)
			b1.roll(3)
			b1.roll(10)
			b1.roll(10)
			b1.roll(10)
			expect(b1.score).to eq(193)
    	end

    	it "returns 168" do
	    	b1=Bowling.new
	    	b1.roll(10)
			b1.roll(7)
			b1.roll(3)
			b1.roll(7)
			b1.roll(2)
			b1.roll(9)
			b1.roll(1)
			b1.roll(10)
			b1.roll(10)
			b1.roll(10)
			b1.roll(2)
			b1.roll(3)
			b1.roll(6)
			b1.roll(4)
			b1.roll(7)
			b1.roll(3)
			b1.roll(3)
			expect(b1.score).to eq(168)
    	end


  end
end
