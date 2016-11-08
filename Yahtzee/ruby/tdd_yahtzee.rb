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
    pairs.size >= 1 ? pairs.last * 2 : 0
  end

  def two_pairs(roll)
    pairs = find_pairs(roll)
    pairs.size == 2 ? (pairs[0] + pairs[1]) * 2 : 0
  end

  def three_of_a_kind(roll)
    triples = find_triples(roll)
    triples.size == 1 ? triples[0] * 3 : 0
  end

  def four_of_a_kind(roll)
    quadruples = find_quadruples(roll)
    quadruples.size == 1 ? quadruples[0] * 4 : 0
  end

  def small_straight(roll)
    roll.sort == [1,2,3,4,5] ? 15 : 0
  end

  def large_straight(roll)
    roll.sort == [2,3,4,5,6] ? 20 : 0
  end

  def full_house(roll)
    pair            = pair(roll)
    three_of_a_kind = three_of_a_kind(roll)

    if pair > 0 && three_of_a_kind > 0
      pair + three_of_a_kind
    else
      0
    end
  end

  private

  def sum_matching(collection, match)
    collection.select { |e| e == match }.reduce(0, :+)
  end

  def find_pairs(roll)
    dice_repeated(2, roll)
  end

  def find_triples(roll)
    dice_repeated(3, roll)
  end

  def find_quadruples(roll)
    dice_repeated(4, roll)
  end

  def dice_repeated(times, roll)
    (1..6).select do |i|
      roll.count(i) == times
    end
  end
end
