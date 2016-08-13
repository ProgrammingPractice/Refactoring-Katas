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
    if @p1_points == @p2_points
      tie_score(@p1_points)
    else
      different_score
    end
  end

  private

  def tie_score(points)
    if points <= 3
      SCORE_NAMES[points] + '-All'
    else
      "Deuce"
    end
  end

  def different_score
    difference = (@p1_points - @p2_points).abs
    max_points = [@p1_points, @p2_points].max

    if max_points >= 4
      if @p1_points > @p2_points
        leader = @p1_name
      else
        leader = @p2_name
      end

      if difference == 1
        advantage_score(leader)
      else
        win_score(leader)
      end
    else
      temporary_score
    end
  end

  def advantage_score(leader)
    "Advantage " + leader
  end

  def win_score(leader)
    "Win for " + leader
  end

  def temporary_score
    SCORE_NAMES[@p1_points] + "-" + SCORE_NAMES[@p2_points]
  end
end

class TennisGame2
  def initialize(p1_name, p2_name)
    @p1_name = p1_name
    @p2_name = p2_name
    @p1_points = 0
    @p2_points = 0
  end
      
  def won_point(playerName)
    if playerName == @p1_name
      p1Score()
    else
      p2Score()
    end
  end

  def score
    result = ""
    if (@p1_points == @p2_points and @p1_points < 4)
      if (@p1_points==0)
        result = "Love"
      end
      if (@p1_points==1)
        result = "Fifteen"
      end
      if (@p1_points==2)
        result = "Thirty"
      end
      if (@p1_points==3)
        result = "Forty"
      end
      result += "-All"
    end
    if (@p1_points==@p2_points and @p1_points>3)
        result = "Deuce"
    end
    
    p1res = ""
    p2res = ""
    if (@p1_points > 0 and @p2_points==0)
      if (@p1_points==1)
        p1res = "Fifteen"
      end
      if (@p1_points==2)
        p1res = "Thirty"
      end
      if (@p1_points==3)
        p1res = "Forty"
      end
      p2res = "Love"
      result = p1res + "-" + p2res
    end
    if (@p2_points > 0 and @p1_points==0)
      if (@p2_points==1)
        p2res = "Fifteen"
      end
      if (@p2_points==2)
        p2res = "Thirty"
      end
      if (@p2_points==3)
        p2res = "Forty"
      end
      
      p1res = "Love"
      result = p1res + "-" + p2res
    end
    
    if (@p1_points>@p2_points and @p1_points < 4)
      if (@p1_points==2)
        p1res="Thirty"
      end
      if (@p1_points==3)
        p1res="Forty"
      end
      if (@p2_points==1)
        p2res="Fifteen"
      end
      if (@p2_points==2)
        p2res="Thirty"
      end
      result = p1res + "-" + p2res
    end
    if (@p2_points>@p1_points and @p2_points < 4)
      if (@p2_points==2)
        p2res="Thirty"
      end
      if (@p2_points==3)
        p2res="Forty"
      end
      if (@p1_points==1)
        p1res="Fifteen"
      end
      if (@p1_points==2)
        p1res="Thirty"
      end
      result = p1res + "-" + p2res
    end
    if (@p1_points > @p2_points and @p2_points >= 3)
      result = "Advantage " + @p1_name
    end
    if (@p2_points > @p1_points and @p1_points >= 3)
      result = "Advantage " + @p2_name
    end
    if (@p1_points>=4 and @p2_points>=0 and (@p1_points-@p2_points)>=2)
      result = "Win for " + @p1_name
    end
    if (@p2_points>=4 and @p1_points>=0 and (@p2_points-@p1_points)>=2)
      result = "Win for " + @p2_name
    end
    result
  end

  def setp1Score(number)
    (0..number).each do |i|
        p1Score()
    end
  end

  def setp2Score(number)
    (0..number).each do |i|
      p2Score()
    end
  end

  def p1Score
    @p1_points +=1
  end
  
  def p2Score
    @p2_points +=1
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
