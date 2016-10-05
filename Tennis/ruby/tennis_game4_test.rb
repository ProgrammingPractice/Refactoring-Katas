require File.join(File.dirname(__FILE__), 'tennis')
require 'test/unit'

class TestTennisGame4 < Test::Unit::TestCase
  def setup
    @game = TennisGame4.new('Name 1', 'Name 2')
  end

  def test_initial_score_is_love_all
    expect_score('Love-All')
  end

  def test_player_one_has_one_point_is_fifteen_love
    player_won_points('Name 1', 1)
    expect_score('Fifteen-Love')
  end

  def test_player_two_has_one_point_is_love_fifteen
    player_won_points('Name 2', 1)
    expect_score('Love-Fifteen')
  end

  def test_player_one_has_two_points_is_thirty_love
    player_won_points('Name 1', 2)
    expect_score('Thirty-Love')
  end

  def test_player_two_has_two_points_is_love_thirty
    player_won_points('Name 2', 2)
    expect_score('Love-Thirty')
  end

  def test_player_one_has_three_points_is_forty_love
    player_won_points('Name 1', 3)
    expect_score('Forty-Love')
  end

  def test_player_two_has_three_points_is_love_forty
    player_won_points('Name 2', 3)
    expect_score('Love-Forty')
  end

  def test_both_players_have_one_point_is_fifteen_all
    player_won_points('Name 1', 1)
    player_won_points('Name 2', 1)
    expect_score('Fifteen-All')
  end

  def test_player_one_has_two_points_player_two_one_point_is_thirty_fifteen
    player_won_points('Name 1', 2)
    player_won_points('Name 2', 1)
    expect_score('Thirty-Fifteen')
  end

  def test_both_players_have_four_points_is_deuce
    player_won_points('Name 1', 4)
    player_won_points('Name 2', 4)
    expect_score('Deuce')
  end

  def test_player_one_has_four_point_player_two_zero_point_is_player_one_win
    player_won_points('Name 1', 4)
    expect_score('Win for Name 1')
  end

  def test_player_one_has_four_point_player_two_three_point_is_advantage_player_one
    player_won_points('Name 1', 4)
    player_won_points('Name 2', 3)
    expect_score('Advantage Name 1')
  end

  private

  def player_won_points(name, count)
    count.times { @game.won_point(name) }
  end

  def expect_score(expected)
    assert_equal(expected, @game.score)
  end
end