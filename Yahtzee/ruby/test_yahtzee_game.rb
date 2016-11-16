gem 'minitest', '>= 5.0.0'
require 'minitest/autorun'

require_relative 'yahtzee_game'

class YahtzeeGameTest < Minitest::Test
  class FakeDiceRoller
    def initialize(values)
      @values = values
    end

    def roll_one
      @values.shift
    end
  end

  def test_complete_round
    skip
    player_rolls([1,1,1,1,1])
    player_selects_category('ones')
    player_gets_score(5)
  end

  def player_rolls(roll)
    roller = FakeDiceRoller.new roll
    @game = YahtzeeGame.new(roller)
    @game.roll_dice
  end

  def player_selects_category(category)
    @game.place_in_category_and_calculate_score(category)
  end

  def player_gets_score(expected)
    assert_equal expected, @game.score
  end

  def test_roll_dice_performs_a_roll_and_saves_it_on_the_game
    game = YahtzeeGame.new
    game.roll_dice
    assert_equal 5, game.roll.size
  end

  def test_roll_dice_performs_a_random_roll
    roller = FakeDiceRoller.new [1,2,3,4,5]
    game = YahtzeeGame.new(roller)
    game.roll_dice
    assert_equal [1,2,3,4,5], game.roll
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

  def test_place_in_category_and_calculate_score
    roller = FakeDiceRoller.new [1,2,3,4,5]
    game = YahtzeeGame.new(roller)
    game.roll_dice
    assert_equal 15, game.place_in_category_and_calculate_score('chance')
  end

  def test_score_initially_is_zero
    game = YahtzeeGame.new
    assert_equal 0, game.score
  end

  def test_score_gets_updated_after_one_round
    roller = FakeDiceRoller.new [1,2,3,4,5]
    game = YahtzeeGame.new(roller)
    game.roll_dice
    game.place_in_category_and_calculate_score('chance')
    assert_equal 15, game.score
  end

  def test_score_keeps_track_of_multiple_rounds
    roller = FakeDiceRoller.new [1,2,3,4,5,1,1,1,1,1]
    game = YahtzeeGame.new(roller)
    game.roll_dice
    game.place_in_category_and_calculate_score('chance')
    game.roll_dice
    game.place_in_category_and_calculate_score('yahtzee')
    assert_equal 65, game.score
  end
end
