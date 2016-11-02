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

  def test_yahtzee_with_all_the_same
    assert_equal 50, Yahtzee.yahtzee([2,2,2,2,2])
  end

  def test_yahtzee_with_at_least_one_different
    assert_equal 0, Yahtzee.yahtzee([2,2,4,2,2])
  end

  def test_ones_with_no_ones
    assert_equal 0, Yahtzee.ones([2,2,2,2,2])
  end

  def test_ones_with_three_ones
    assert_equal 3, Yahtzee.ones([1,2,2,1,1])
  end

  def test_twos_with_no_twos
    assert_equal 0, Yahtzee.twos([1,1,1,1,1])
  end

  def test_twos_with_one_two
    assert_equal 2, Yahtzee.twos([1,2,1,1,1])
  end

  def test_twos_with_four_twos
    assert_equal 8, Yahtzee.twos([1,2,2,2,2])
  end
end
