require_relative 'tdd_yahtzee'
require 'test/unit'

class TddYahtzeeTest < Test::Unit::TestCase
  def test_initial_score_is_0
    assert Yahtzee.new.score == 0
  end

  def test_chance_with_roll_11111
    assert Yahtzee.new.calculate_score([1,1,1,1,1], "chance") == 5
  end

  def test_chance_with_roll_66666
    assert Yahtzee.new.calculate_score([6,6,6,6,6], "chance") == 30
  end
end