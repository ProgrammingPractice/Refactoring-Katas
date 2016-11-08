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

  def test_threes
    assert_equal 0, Yahtzee.threes([2,2,4,5,6])
    assert_equal 3, Yahtzee.threes([2,3,4,5,6])
    assert_equal 9, Yahtzee.threes([2,3,3,3,6])
  end

  def test_fours
    assert_equal 0,  Yahtzee.fours([2,2,3,5,6])
    assert_equal 4,  Yahtzee.fours([2,3,4,5,6])
    assert_equal 12, Yahtzee.fours([4,3,4,3,4])
  end

  def test_fives
    assert_equal 0,  Yahtzee.fives([2,2,3,6,6])
    assert_equal 5,  Yahtzee.fives([2,3,4,5,6])
    assert_equal 10, Yahtzee.fives([4,5,4,5,4])
  end

  def test_sixes
    assert_equal 0,  Yahtzee.sixes([2,2,3,5,5])
    assert_equal 6,  Yahtzee.sixes([2,3,4,5,6])
    assert_equal 18, Yahtzee.sixes([4,6,6,6,4])
  end

  def test_pair
    assert_equal 0,  Yahtzee.pair([2,3,4,5,6])
    assert_equal 0,  Yahtzee.pair([2,2,2,2,6])
    assert_equal 2,  Yahtzee.pair([1,2,3,4,1])
    assert_equal 4,  Yahtzee.pair([2,2,4,5,6])
    assert_equal 12, Yahtzee.pair([1,1,6,6,5])
  end

  def test_two_pairs
    assert_equal 0, Yahtzee.two_pairs([1,2,3,4,5])
    assert_equal 0, Yahtzee.two_pairs([1,1,2,3,4])
    assert_equal 0, Yahtzee.two_pairs([1,1,4,4,4])
    assert_equal 8, Yahtzee.two_pairs([1,1,2,3,3])
  end

  def test_three_of_a_kind
    assert_equal 0, Yahtzee.three_of_a_kind([3,3,4,5,6])
    assert_equal 0, Yahtzee.three_of_a_kind([3,3,3,3,4])
    assert_equal 9, Yahtzee.three_of_a_kind([3,3,3,4,5])
  end

  def test_four_of_a_kind
    assert_equal 0, Yahtzee.four_of_a_kind([2,2,2,4,4])
    assert_equal 0, Yahtzee.four_of_a_kind([2,2,2,2,2])
    assert_equal 8, Yahtzee.four_of_a_kind([2,2,2,2,4])
  end

  def test_small_straight
    assert_equal 0,  Yahtzee.small_straight([2,3,4,5,6])
    assert_equal 15, Yahtzee.small_straight([5,4,3,2,1])
    assert_equal 15, Yahtzee.small_straight([1,2,3,4,5])
  end

  def test_large_straight
    assert_equal 0,  Yahtzee.large_straight([1,2,3,4,5])
    assert_equal 20, Yahtzee.large_straight([6,5,4,3,2])
    assert_equal 20, Yahtzee.large_straight([2,3,4,5,6])
  end
end