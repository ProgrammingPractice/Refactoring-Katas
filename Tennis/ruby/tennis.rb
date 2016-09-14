class TennisGame1
  SCORE_NAMES = {
    0 => "Love",
    1 => "Fifteen",
    2 => "Thirty",
    3 => "Forty",
  }

  def initialize(p1_name, p2_name)
    @p1_name = p1_name
    @p2_name = p2_name
    @p1_points = 0
    @p2_points = 0
  end

  def won_point(player_name)
    if player_name == @p1_name
      @p1_points += 1
    else
      @p2_points += 1
    end
  end

  def score
    max_points = [@p1_points, @p2_points].max

    if max_points >= 4
      big_score
    else
      small_score
    end
  end

  private

  def big_score
    difference = (@p1_points - @p2_points).abs

    if difference == 0
      "Deuce"
    elsif difference == 1
      "Advantage " + leader_name
    else
      "Win for " + leader_name
    end
  end

  def leader_name
    if @p1_points > @p2_points
      @p1_name
    else
      @p2_name
    end
  end

  def small_score
    if @p1_points == @p2_points
      SCORE_NAMES[@p1_points] + '-All'
    else
      SCORE_NAMES[@p1_points] + "-" + SCORE_NAMES[@p2_points]
    end
  end
end

class TennisGame2
  SCORE_NAMES = {
    0 => 'Love',
    1 => 'Fifteen',
    2 => 'Thirty',
    3 => 'Forty'
  }

  def initialize(p1_name, p2_name)
    @p1_name   = p1_name
    @p2_name   = p2_name
    @p1_points = 0
    @p2_points = 0
  end

  def won_point(player_name)
    if player_name == @p1_name
      @p1_points += 1
    else
      @p2_points += 1
    end
  end

  def score
    if @p1_points == @p2_points
      if @p1_points < 4
        SCORE_NAMES[@p1_points] + "-All"
      else
        "Deuce"
      end
    else
      if (@p1_points == 0 || @p2_points == 0) || (@p1_points < 4 && @p2_points < 4)
        p1res = SCORE_NAMES[@p1_points] || ""
        p2res = SCORE_NAMES[@p2_points] || ""

        result = p1res + "-" + p2res
      end

      leader_name = @p1_points > @p2_points ? @p1_name : @p2_name

      if (@p1_points - @p2_points).abs >= 2 && (@p1_points >= 4 || @p2_points >= 4)
        result = "Win for " + leader_name
      elsif (@p1_points > @p2_points && @p2_points >= 3) || (@p2_points > @p1_points && @p1_points >= 3)
        result = "Advantage " + leader_name
      end

      result
    end
  end
end

class TennisGame3
  def initialize(p1_name, p2_name)
    @p1N = p1_name
    @p2N = p2_name
    @p1 = 0
    @p2 = 0
  end
      
  def won_point(n)
    if n == @p1N
        @p1 += 1
    else
        @p2 += 1
    end
  end
  
  def score
    if (@p1 < 4 and @p2 < 4)
      p = ["Love", "Fifteen", "Thirty", "Forty"]
      s = p[@p1]
      @p1 == @p2 ? s + "-All" : s + "-" + p[@p2]
    else
      if (@p1 == @p2)
        "Deuce"
      else
        s = @p1 > @p2 ? @p1N : @p2N
        (@p1-@p2)*(@p1-@p2) == 1 ? "Advantage " + s : "Win for " + s
      end
    end
  end
end
