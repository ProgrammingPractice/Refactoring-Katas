require_relative 'tdd_yahtzee'
require 'test/unit'

class TddYahtzeeTest < Test::Unit::TestCase
  def test_chance
    assert_equal 5,  Yahtzee.chance([1,1,1,1,1])
    assert_equal 15, Yahtzee.chance([1,2,3,4,5])
    assert_equal 30, Yahtzee.chance([6,6,6,6,6])
  end

  def test_yahtzee
    assert_equal 0,  Yahtzee.yahtzee([2,2,4,2,2])
    assert_equal 50, Yahtzee.yahtzee([2,2,2,2,2])
    assert_equal 50, Yahtzee.yahtzee([5,5,5,5,5])
  end

  def test_ones
    assert_equal 0, Yahtzee.ones([2,2,2,2,2])
    assert_equal 3, Yahtzee.ones([1,2,2,1,1])
    assert_equal 5, Yahtzee.ones([1,1,1,1,1])
  end

  def test_twos
    assert_equal 0, Yahtzee.twos([1,1,1,1,1])
    assert_equal 2, Yahtzee.twos([1,2,1,1,1])
    assert_equal 8, Yahtzee.twos([1,2,2,2,2])
  end
end