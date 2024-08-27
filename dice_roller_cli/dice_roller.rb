# dice_roller.rb

class DiceRoller
  attr_reader :dice, :roll_results

  def initialize(dice)
    @dice = dice
    @roll_results = []
    roll_all_dice
  end

  def total
    @roll_results.sum
  end

  def description
    dice_summary = @dice.tally.map { |sides, count| "#{count}d#{sides}" }
    dice_summary.join(', ')
  end

  private

  def roll_all_dice
    @dice.each do |sides|
      @roll_results << roll_die(sides)
    end
  end

  def roll_die(sides)
    rand(1..sides)
  end
end

class DiceRollerCLI
  def initialize
    @dice = []
  end

  def start
    welcome_message
    collect_dice_input
    display_results
  end

  private

  def welcome_message
    puts "Welcome to the Dice Roller Simulator!"
  end

  def collect_dice_input
    puts "How many dice would you like to roll?"
    number_of_dice = gets.chomp.to_i

    number_of_dice.times do |i|
      puts "Enter the number of sides for die ##{i + 1}:"
      sides = gets.chomp.to_i
      @dice << sides
    end
  end

  def display_results
    roller = DiceRoller.new(@dice)
    puts "Rolling dice..."
    puts "You rolled: #{roller.roll_results.inspect}"
    puts "Description: #{roller.description}"
    puts "Total: #{roller.total}"
  end
end

# Run the CLI if the script is executed directly
if __FILE__ == $PROGRAM_NAME
  DiceRollerCLI.new.start
end
