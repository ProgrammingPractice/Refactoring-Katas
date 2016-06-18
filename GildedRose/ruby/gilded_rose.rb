
class GildedRose
  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      if item.name == "Aged Brie" || item.name == "Backstage passes to a TAFKAL80ETC concert"
        if item.quality < 50
          item.quality += 1

          if item.name == "Backstage passes to a TAFKAL80ETC concert"
            if item.sell_in < 11
              if item.quality < 50
                item.quality += 1
              end
            end

            if item.sell_in < 6
              if item.quality < 50
                item.quality += 1
              end
            end
          end
        end
      else
        decrease_quality_if_not_special(item)
      end

      decrese_sell_in(item)

      if item.sell_in < 0
        if item.name != "Aged Brie"
          if item.name != "Backstage passes to a TAFKAL80ETC concert"
            decrease_quality_if_not_special(item)
          else
            item.quality = 0
          end
        else
          if item.quality < 50
            item.quality += 1
          end
        end
      end
    end
  end

  def decrease_quality_if_not_special(item)
    if item.quality > 0
      if special_item?(item)
        item.quality -= 1
      end
    end
  end

  def decrese_sell_in(item)
    if special_item?(item)
      item.sell_in -= 1
    end
  end

  def special_item?(item)
    item.name != "Sulfuras, Hand of Ragnaros"
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