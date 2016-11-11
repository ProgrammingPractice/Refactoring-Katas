gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'

require_relative 'yahtzee_game'

class YahtzeeGameTest < Minitest::Test
  def test_roll_returns_a_roll_of_five_dice
    game = YahtzeeGame.new
    assert_equal 5, game.roll.size
  end

  def test_roll_returns_a_roll_of_five_random_dice
    game = YahtzeeGame.new
    dice = [1,2,3,4,5]
    fake_roll = -> { dice.shift }
    game.stub(:roll_one, fake_roll) do
      assert_equal [1,2,3,4,5], game.roll
    end
  end

  def test_roll_one_returns_a_valid_dice_value
    game = YahtzeeGame.new
    assert (1..6).include?(game.roll_one)
  end

  def test_roll_one_returns_a_random_dice
    game = YahtzeeGame.new
    game.stub(:rand, 4) do
      assert_equal 5, game.roll_one
    end
  end

  def test_cathegories_lists_all_the_cathegories
    expected = [
      'Chance',
      'Yahtzee',
      'Ones',
      'Twos',
      'Threes',
      'Fours',
      'Fives',
      'Sixes',
      'Pair',
      'Two pairs',
      'Three of a kind',
      'Four of a kind',
      'Small straight',
      'Large straight',
      'Full house',
    ]
    game = YahtzeeGame.new
    assert_equal expected, game.cathegories
  end
end
