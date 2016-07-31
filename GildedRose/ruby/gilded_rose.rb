
class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each(&:update_quality)
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s
    "#{@name}, #{@sell_in}, #{@quality}"
  end

  def update_quality
    decrease_sell_in

    if sell_in < 0
      decrease_quality(2)
    else
      decrease_quality(1)
    end
  end

  private

  def increase_quality(amount)
    if quality < 50
      self.quality += amount
    end
  end

  def decrease_quality(amount)
    self.quality = [quality - amount, 0].max
  end

  def decrease_sell_in
    self.sell_in -= 1
  end
end

class SulfurasItem < Item
  def update_quality
    # do nothing
  end
end

class OldCheeseItem < Item
  def update_quality
    decrease_sell_in

    if sell_in < 0
      increase_quality(2)
    else
      increase_quality(1)
    end
  end
end

class ConcertTicketItem < Item
  def update_quality
    decrease_sell_in
    increase_quality(1)

    if sell_in < 10
      increase_quality(1)
    end

    if sell_in < 5
      increase_quality(1)
    end

    if sell_in < 0
      self.quality = 0
    end
  end
end

class ConjuredItem < Item
  def update_quality
    decrease_sell_in

    if sell_in < 0
      decrease_quality(4)
    else
      decrease_quality(2)
    end
  end
end
