module Yahtzee
  extend self

  def chance(roll)
    roll.reduce(:+)
  end
end