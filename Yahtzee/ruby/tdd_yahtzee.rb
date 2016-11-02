class Yahtzee
  def score
    0
  end

  def calculate_score(roll, category)
    roll.reduce(:+)
  end
end