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
  SIMPLE_SCORE_NAMES = {
    0 => 'Love',
    1 => 'Fifteen',
    2 => 'Thirty',
    3 => 'Forty'
  }

  SPECIAL_SCORE_NAMES = Hash.new("Win for ").merge(
    0 => "Deuce",
    1 => "Advantage "
  )

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
    leader_points = [@p1_points, @p2_points].max
    difference    = (@p1_points - @p2_points).abs

    if leader_points < 4
      if difference == 0
        SIMPLE_SCORE_NAMES[@p1_points] + "-" + "All"
      else
        SIMPLE_SCORE_NAMES[@p1_points] + "-" + SIMPLE_SCORE_NAMES[@p2_points]
      end
    else
      SPECIAL_SCORE_NAMES[difference] + leader_name
    end
  end

  private

  def leader_name
    if @p1_points == @p2_points
      ""
    else
      @p1_points > @p2_points ? @p1_name : @p2_name
    end
  end
end

class TennisGame3
  class Player
    attr_reader :name
    attr_reader :score

    def initialize(name)
      @name  = name
      @score = 0
    end

    def won_point
      @score += 1
    end
  end

  def initialize(p1_name, p2_name)
    @p1 = Player.new(p1_name)
    @p2 = Player.new(p2_name)
  end

  def won_point(name)
    if name == @p1.name
      @p1.won_point
    else
      @p2.won_point
    end
  end

  def score
    if [@p1.score, @p2.score].max < 4
      low_score
    else
      high_score
    end
  end

  private

  def low_score
    score_names = ["Love", "Fifteen", "Thirty", "Forty"]
    left  = score_names[@p1.score]
    right = @p1.score == @p2.score ? "All" : score_names[@p2.score]
    left + '-' + right
  end

  def high_score
    if @p1.score == @p2.score
      "Deuce"
    else
      leader = @p1.score > @p2.score ? @p1 : @p2
      prefix = advantage_difference? ? "Advantage " : "Win for "
      prefix + leader.name
    end
  end

  def advantage_difference?
    (@p1.score - @p2.score).abs == 1
  end
end

class TennisGame4
  def initialize(p1_name, p2_name)
    @p1_name   = p1_name
    @p2_name   = p2_name
    @p1_points = 0
    @p2_points = 0
  end

  def won_point(name)
    if name == @p1_name
      @p1_points += 1
    else
      @p2_points += 1
    end
  end

  def score
    scores = {
      0 => 'Love',
      1 => 'Fifteen',
      2 => 'Thirty',
      3 => 'Forty'
    }

    if @p1_points == @p2_points
      if @p1_points >= 4
        'Deuce'
      else
        scores[@p1_points] + '-' + 'All'
      end
    else
      if @p1_points >= 4
        if @p1_points - @p2_points >= 2
          'Win for ' + @p1_name
        else
          'Advantage ' + @p1_name
        end
      else
        scores[@p1_points] + '-' + scores[@p2_points]
      end
    end
  end
end
