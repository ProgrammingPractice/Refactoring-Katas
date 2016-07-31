# Usage:
# ruby characterization_test.rb --record
# ruby characterization_test.rb --test

require File.join(File.dirname(__FILE__), 'gilded_rose')

GOLD_MASTER_PATH = 'fixtures/gold_master.txt'

def run_program
  output = ""

  output << "OMGHAI!\n"
  items = [
    Item.new(name="+5 Dexterity Vest", sell_in=10, quality=20),
    Item.new(name="Aged Brie", sell_in=2, quality=0),
    Item.new(name="Elixir of the Mongoose", sell_in=5, quality=7),
    SulfurasItem.new(name="Sulfuras, Hand of Ragnaros", sell_in=0, quality=80),
    SulfurasItem.new(name="Sulfuras, Hand of Ragnaros", sell_in=-1, quality=80),
    Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=15, quality=20),
    Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=10, quality=49),
    Item.new(name="Backstage passes to a TAFKAL80ETC concert", sell_in=5, quality=49),
    Item.new(name="Conjured Mana Cake", sell_in=3, quality=25),
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
  File.write(GOLD_MASTER_PATH, result)
  puts "Gold Master recorded"
end

def run_test
  actual   = run_program
  expected = File.read(GOLD_MASTER_PATH)

  if actual == expected
    puts "OK"
  else
    puts "ERROR: test failed!"
  end
end

if ARGV[0] == '--record'
  write_gold_master
elsif ARGV[0] == '--test'
  run_test
else
  puts "ERROR: unrecognized argument '#{ARGV[0]}'"
end
