module Yahtzee
  extend self

  def chance(roll)
    roll.reduce(:+)
  end

  def yahtzee(roll)
    roll.uniq.size == 1 ? 50 : 0
  end

  def ones(roll)
    roll.select { |e| e == 1 }.reduce(0, :+)
  end

  def twos(roll)
    0
  end
end
