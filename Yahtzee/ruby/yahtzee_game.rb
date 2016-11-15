class YahtzeeGame
  attr_reader :roll

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

  def roll_dice
    @roll = (1..5).map { roll_one }
  end

  def roll_one
    rand(6) + 1
  end

  def categories
    CATEGORIES
  end
end
