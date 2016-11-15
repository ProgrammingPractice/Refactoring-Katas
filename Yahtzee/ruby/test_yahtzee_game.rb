gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'

require_relative 'yahtzee_game'

class YahtzeeGameTest < Minitest::Test
  def test_roll_dice_performs_a_roll_and_saves_it_on_the_game
    game = YahtzeeGame.new
    game.roll_dice
    assert_equal 5, game.roll.size
  end

  def test_roll_dice_performs_a_random_roll
    game = YahtzeeGame.new
    dice = [1,2,3,4,5]
    fake_roll = -> { dice.shift }
    game.stub(:roll_one, fake_roll) do
      game.roll_dice
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

  def test_categories_lists_all_the_categories
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
    assert_equal expected, game.categories
  end
end
