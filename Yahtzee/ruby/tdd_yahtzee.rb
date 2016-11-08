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

  def threes(roll)
    sum_matching(roll, 3)
  end

  def fours(roll)
    sum_matching(roll, 4)
  end

  def fives(roll)
    sum_matching(roll, 5)
  end

  def sixes(roll)
    sum_matching(roll, 6)
  end

  def pair(roll)
    pairs = find_pairs(roll)
    pairs.empty? ? 0 : pairs[0]
  end

  def two_pairs(roll)
    pairs = find_pairs(roll)
    pairs.size == 2 ? pairs[0] + pairs[1] : 0
  end

  private

  def sum_matching(collection, match)
    collection.select { |e| e == match }.reduce(0, :+)
  end

  def find_pairs(roll)
    pairs = []

    6.downto(1) do |i|
      same_dice = roll.select { |e| e == i }
      if same_dice.size == 2
        pairs << 2 * i
      end
    end

    pairs
  end
end
