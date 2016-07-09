
class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if item.name == "Aged Brie" || item.name == "Backstage passes to a TAFKAL80ETC concert"
        increase_quality(item)

        if item.name == "Backstage passes to a TAFKAL80ETC concert"
          if item.sell_in <= 10
            increase_quality(item)
          end

          if item.sell_in <= 5
            increase_quality(item)
          end
        end
      else
        decrease_quality(item)
      end

      decrese_sell_in(item)

      if item.sell_in < 0
        if item.name == "Aged Brie"
          increase_quality(item)
        else
          if item.name == "Backstage passes to a TAFKAL80ETC concert"
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
    if !special_item?(item)
      if item.quality > 0
        item.quality -= 1
      end
    end
  end

  def decrese_sell_in(item)
    if !special_item?(item)
      item.sell_in -= 1
    end
  end

  def special_item?(item)
    item.name == "Sulfuras, Hand of Ragnaros"
  end
end

class Item
  attr_accessor :name, :sell_in, :quality

  def initialize(name, sell_in, quality)
    @name = name
    @sell_in = sell_in
    @quality = quality
  end

  def to_s()
    "#{@name}, #{@sell_in}, #{@quality}"
  end
end