require_relative 'bowling'

describe Bowling do

    describe "#strikes_score" do
      it "10 strikes should scores 300" do
        expect(subject.strikes_score("XXXXXXXXXX")).to eq(300)
      end

      it "9  strikes should scores 270" do
        expect(subject.strikes_score("XXXXXXXXX-")).to eq(270)
      end

      it "8  strikes should scores 240" do
        expect(subject.strikes_score("XXXXXXXX--")).to eq(240)
      end

      it "7  strikes should scores 210" do
        expect(subject.strikes_score("XXXXXXX---")).to eq(210)
      end

      it "0  strikes should scores 0" do
        expect(subject.strikes_score("----------")).to eq(0)
      end
    end

    describe "#spares_score" do
      it "10 spares should scores 150" do
        expect(subject.spares_score("YYYYYYYYYY")).to eq(150)
      end

      it "9  spares should scores 135" do
        expect(subject.spares_score("YYYYYYYYY--")).to eq(135)
      end

      it "8  spares should scores 120" do
        expect(subject.spares_score("YYYYYYYY----")).to eq(120)
      end

      it "5  spares should scores 75" do
        expect(subject.spares_score("YYYYY----------")).to eq(75)
      end

      it "1  spare  should scores 15" do
        expect(subject.spares_score("Y------------------")).to eq(15)
      end

      it "0  spare  should scores 0" do
        expect(subject.spares_score("--------------------")).to eq(0)
      end
    end

    describe "#score" do
      it "9 strikes and 1 spare  should scores 285" do
        expect(subject.score("XXXXXXXXXY")).to eq(285)
      end

      it "8 strikes and 2 spares should scores 270" do
        expect(subject.score("XXXXXXXXYY")).to eq(270)
      end

      it "7 strikes and 3 spares should scores 255" do
        expect(subject.score("XXXXXXXYYY")).to eq(255)
      end

      it "1 strike  and 9 spares should scores 165" do
        expect(subject.score("XYYYYYYYYY")).to eq(165)
      end

      it "8 strikes, 1 spare and 2 misses should scores 255" do
        expect(subject.score("XXXXXXXXY--")).to eq(255)
      end

      it "8 strikes, 1 spare, 2 and 6 should scores 263" do
        expect(subject.score("XXXXXXXXY26")).to eq(263)
      end

      it "7 strikes, 1 spare, 2 and 6 and 2 misses should score 233" do
        expect(subject.score("XXXXXXXY26--")).to eq(233)
      end

      it "6 and 2 and misses scores 8" do
        expect(subject.score("62------------------")).to eq(8)
      end

      it "just misses scores 0" do
        expect(subject.score("--------------------")).to eq(0)
      end

      it "hit 8 and misses scores 8" do
        expect(subject.score("8-------------------")).to eq(8)
      end

      it "a miss and spare and misses scores 15" do
        expect(subject.score("-Y------------------")).to eq(15)
      end

      it "1 strike, 1 spare, 6 and 2 scores 59" do
        expect(subject.score("X--6Y62------------")).to eq(59)
      end
    end
end
