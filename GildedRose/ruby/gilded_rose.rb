
class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      decrese_sell_in(item)

      if old_cheese?(item) || concert_ticket?(item)
        increase_quality(item)

        if concert_ticket?(item)
          if item.sell_in < 10
            increase_quality(item)
          end

          if item.sell_in < 5
            increase_quality(item)
          end
        end
      else
        decrease_quality(item)
      end

      if item.sell_in < 0
        if old_cheese?(item)
          increase_quality(item)
        else
          if concert_ticket?(item)
            item.quality = 0
          else
            decrease_quality(item)
          end
        end
      end
    end
  end

  def increase_quality(item)
    if item.quality < 50
      item.quality += 1
    end
  end

  def decrease_quality(item)
    if !sulfuras?(item)
      if item.quality > 0
        item.quality -= 1
      end
    end
  end

  def decrese_sell_in(item)
    if !sulfuras?(item)
      item.sell_in -= 1
    end
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
end