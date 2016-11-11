class YahtzeeGame
  def roll
    (1..5).map { roll_one }
  end

  def roll_one
    rand(6) + 1
  end
end
