require File.join(File.dirname(__FILE__), 'tennis')
require 'test/unit'

class TestTennisGame4 < Test::Unit::TestCase
  def test_initial_score_is_love_all
    game = TennisGame4.new(nil, nil)
    assert_equal('Love-All', game.score)
  end
end