require File.join(File.dirname(__FILE__), 'tennis')
require 'test/unit'

class TestTennisGame4 < Test::Unit::TestCase
  def test_initial_score_is_love_all
    game = TennisGame4.new(nil, nil)
    assert_equal('Love-All', game.score)
  end

  def test_player_one_has_one_point_is_fifteen_love
    game = TennisGame4.new('Name 1', 'Name 2')
    game.won_point('Name 1')
    assert_equal('Fifteen-Love', game.score)
  end
end