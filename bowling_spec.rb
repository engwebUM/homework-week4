require_relative './bowling'
require 'rspec'

RSpec.describe Bowling do
  before(:each) do
    @b = Bowling.new
  end

  context '#roll' do
    it "odd number of rolls" do
      (1..3).each { @b.roll(1) }
      expect(@b.score).to eq(3)
    end  

    it "even number of rolls" do
      (1..4).each { @b.roll(1) }
      expect(@b.score).to eq(4)
    end

    it "spare" do
      (1..3).each { @b.roll(5) }
      expect(@b.score).to eq(20)
    end

    it "strike" do
      @b.roll(10)
      @b.roll(1)
      @b.roll(1)
      expect(@b.score).to eq(14)
    end

    context "can't roll anymore after the 10th frame" do
      it "random example" do
        (1..20).each { @b.roll(1) }
        score = @b.score
        (1..12).each { @b.roll(1) }
        expect(@b.score).to eq(score)
      end

      it "spare in the last frame" do
        [1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8, 6].each { |x| @b.roll(x) }
        score = @b.score
        (1..12).each { @b.roll(1) }
        expect(@b.score).to eq(score)
      end

      it "strike in the last frame" do
        (1..12).each { @b.roll(10) }
        score = @b.score
        (1..12).each { @b.roll(1) }
        expect(@b.score).to eq(score)
      end
    end
  end

  context '#score' do
    it "the score is initially 0" do
      expect(@b.score).to eq(0)
    end

    it "given example" do
      [1, 4, 4, 5, 6, 4, 5, 5, 10, 0, 1, 7, 3, 6, 4, 10, 2, 8, 6].each { |x| @b.roll(x) }
      expect(@b.score).to eq(133)
    end

    it "minimum score" do
      (1..10).each { @b.roll(0) }
      expect(@b.score).to eq(0)
    end

    it "maximum score" do
      (1..12).each { @b.roll(10) }
      expect(@b.score).to eq(300)
    end
  end
end
