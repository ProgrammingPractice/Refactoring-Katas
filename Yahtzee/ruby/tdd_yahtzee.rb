module Yahtzee
  extend self

  def chance(roll)
    roll.reduce(:+)
  end

  def yahtzee(roll)
    roll.uniq.size == 1 ? 50 : 0
  end

  def ones(roll)
    sum_matching(roll, 1)
  end

  def twos(roll)
    sum_matching(roll, 2)
  end

  private

  def sum_matching(collection, match)
    collection.select { |e| e == match }.reduce(0, :+)
  end
end
