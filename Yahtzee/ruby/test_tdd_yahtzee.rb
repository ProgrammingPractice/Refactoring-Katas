require_relative 'tdd_yahtzee'
require 'test/unit'

class TddYahtzeeTest < Test::Unit::TestCase
  def test_chance_with_roll_11111
    assert Yahtzee.chance([1,1,1,1,1]) == 5
  end

  def test_chance_with_roll_12345
    assert Yahtzee.chance([1,2,3,4,5]) == 15
  end

  def test_chance_with_roll_66666
    assert Yahtzee.chance([6,6,6,6,6]) == 30
  end
end