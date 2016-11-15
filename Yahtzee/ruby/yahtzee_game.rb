require_relative 'tdd_yahtzee'

class YahtzeeGame
  attr_reader :roll
  attr_reader :score

  CATEGORIES = [
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
    'Full house'
  ]

  def initialize
    @score = 0
  end

  def roll_dice
    @roll = (1..5).map { roll_one }
  end

  def roll_one
    rand(6) + 1
  end

  def categories
    CATEGORIES
  end

  def place_in_category_and_calculate_score(category)
    @score = Yahtzee.chance(roll)
  end
end
