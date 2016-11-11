require_relative 'yahtzee_game'
require 'test/unit'

class YahtzeeGameTest < Test::Unit::TestCase
  def test_roll_returns_a_roll_of_five_dice
    game = YahtzeeGame.new
    assert_equal 5, game.roll.size
  end
end
