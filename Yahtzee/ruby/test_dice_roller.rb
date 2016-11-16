gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'

require_relative 'dice_roller'

class DiceRollerTest < Minitest::Test
  def test_roll_one_returns_a_valid_dice_value
    roller = DiceRoller.new
    assert (1..6).include?(roller.roll_one)
  end

  def test_roll_one_returns_a_random_dice
    roller = DiceRoller.new
    roller.stub(:rand, 4) do
      assert_equal 5, roller.roll_one
    end
  end
end
