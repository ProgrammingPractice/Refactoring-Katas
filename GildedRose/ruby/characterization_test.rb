# Usage:
# ruby characterization_test.rb --prepare
# ruby characterization_test.rb --test

require File.join(File.dirname(__FILE__), 'gilded_rose')

def run_program
  output = ""

  output << "OMGHAI!\n"
  items = [
    Item.new(name="+5 Dexterity Vest", sell_in=10, quality=20),
    Item.new(name="Aged Brie", sell_in=2, quality=0),
    Item.new(name="Elixir of the Mongoose", sell_in=5, quality=7),
    Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=0, quality=80),
    Item.new(name="Sulfuras, Hand of Ragnaros", sell_in=-1, quality=80),
    Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=20),
    Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=10, quality=49),
    Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=5, quality=49),
    # This Conjured item does not work properly yet
    Item.new(name="Conjured Mana Cake", sell_in=3, quality=6), # <-- :O
  ]

  gilded_rose = GildedRose.new items
  (0..99).each do |day|
    output << "-------- day #{day} --------\n"
    output << "name, sellIn, quality\n"
    items.each do |item|
      output << item.to_s << "\n"
    end
    output << "\n"
    gilded_rose.update_quality
  end

  output
end

def write_gold_master
  result = run_program
  File.write('gold_master.txt', result)
end

if ARGV[0] == '--prepare'
  write_gold_master
end
