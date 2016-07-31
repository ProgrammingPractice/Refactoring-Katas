
class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      if item.is_a? SulfurasItem
        item.update_quality
      elsif item.is_a? OldCheeseItem
        item.update_quality
      elsif item.is_a? ConcertTicketItem
        item.update_quality
      elsif conjured?(item)
        decrease_sell_in(item)
        decrease_quality(item)
        decrease_quality(item)

        if item.sell_in < 0
          decrease_quality(item)
          decrease_quality(item)
        end
      else
        decrease_sell_in(item)
        decrease_quality(item)

        if item.sell_in < 0
          decrease_quality(item)
        end
      end
    end
  end

  # FIXME: this method is duplicated in Item class. Remove.
  def increase_quality(item)
    if item.quality < 50
      item.quality += 1
    end
  end

  # FIXME: this method is duplicated in Item class. Remove.
  def decrease_quality(item)
    if item.quality > 0
      item.quality -= 1
    end
  end

  # FIXME: this method is duplicated in Item class. Remove.
  def decrease_sell_in(item)
    item.sell_in -= 1
  end

  def sulfuras?(item)
    item.name == "Sulfuras, Hand of Ragnaros"
  end

  def old_cheese?(item)
    item.name == "Aged Brie"
  end

  def concert_ticket?(item)
    item.name == "Backstage passes to a TAFKAL80ETC concert"
  end

  def conjured?(item)
    item.name == "Conjured Mana Cake"
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

  def increase_quality
    if quality < 50
      self.quality += 1
    end
  end

  # def decrease_quality
  #   if quality > 0
  #     self.quality -= 1
  #   end
  # end

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
    increase_quality

    if sell_in < 0
      increase_quality
    end
  end
end

class ConcertTicketItem < Item
  def update_quality
    decrease_sell_in
    increase_quality

    if sell_in < 10
      increase_quality
    end

    if sell_in < 5
      increase_quality
    end

    if sell_in < 0
      self.quality = 0
    end
  end
end
