require File.join(File.dirname(__FILE__), 'tennis')
require 'test/unit'

class TestTennisGame4 < Test::Unit::TestCase
  def test_score
    expect_score(0, 0, 'Love-All')
    expect_score(0, 1, 'Love-Fifteen')
    expect_score(0, 2, 'Love-Thirty')
    expect_score(0, 3, 'Love-Forty')
    expect_score(1, 0, 'Fifteen-Love')
    expect_score(1, 1, 'Fifteen-All')
    expect_score(1, 2, 'Fifteen-Thirty')
    expect_score(1, 3, 'Fifteen-Forty')
    expect_score(2, 0, 'Thirty-Love')
    expect_score(2, 1, 'Thirty-Fifteen')
    expect_score(2, 2, 'Thirty-All')
    expect_score(2, 3, 'Thirty-Forty')
    expect_score(3, 0, 'Forty-Love')
    expect_score(3, 1, 'Forty-Fifteen')
    expect_score(3, 2, 'Forty-Thirty')
    expect_score(3, 3, 'Forty-All')

    expect_score(4, 4, 'Deuce')

    expect_score(4, 0, 'Win for Name 1')
    expect_score(4, 3, 'Advantage Name 1')
  end

  private

  def expect_score(p1_points, p2_points, result)
    game = TennisGame4.new('Name 1', 'Name 2')

    p1_points.times { game.won_point('Name 1') }
    p2_points.times { game.won_point('Name 2') }

    assert_equal(result, game.score)
  end
end