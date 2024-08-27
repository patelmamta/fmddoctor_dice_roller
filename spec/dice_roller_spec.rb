# dice_roller_spec.rb

require_relative '../dice_roller_cli/dice_roller'

RSpec.describe DiceRoller do
  describe "#roll_results" do
    it "rolls the correct number of dice" do
      roller = DiceRoller.new([6, 8, 20])
      expect(roller.roll_results.size).to eq(3)
    end

    it "ensures all rolls are within the valid range" do
      roller = DiceRoller.new([6, 8, 20])
      expect(roller.roll_results[0]).to be_between(1, 6).inclusive
      expect(roller.roll_results[1]).to be_between(1, 8).inclusive
      expect(roller.roll_results[2]).to be_between(1, 20).inclusive
    end
  end

  describe "#total" do
    it "calculates the total correctly" do
      allow_any_instance_of(DiceRoller).to receive(:rand).and_return(3, 5, 10)
      roller = DiceRoller.new([6, 8, 20])
      expect(roller.total).to eq(18)
    end
  end

  describe "#description" do
    it "describes the dice correctly" do
      roller = DiceRoller.new([6, 6, 20])
      expect(roller.description).to eq("2d6, 1d20")
    end
  end
end
