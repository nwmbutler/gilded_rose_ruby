class GildedRose
  attr_reader :items

  AGED_BRIE = "Aged Brie"
  BACKSTAGE_PASS = "Backstage passes to a TAFKAL80ETC concert"
  SULFURAS = "Sulfuras, Hand of Ragnaros"
  NORMAL = "normal"

  def initialize(items)
    @items = items
  end

  case name
  when NORMAL
    normal
  when AGED_BRIE
    aged_brie
  when BACKSTAGE_PASS
    backstage_pass
  when SULFURAS
    sulfuras
  end

  def normal
    items.sell_in -= 1
    return if items.quality == 0
    items.quality -= 1
    items.quality -= 1 if items.sell_in <= 0
  end

  def aged_brie
    items.sell_in -= 1
    return if items.quality == 50
    items.quality += 1
  end

  def backstage_pass
   if items.sell_in <= 0
     items.quality = 0
     items.sell_in -= 1
   elsif items.sell_in <= 5
     items.quality += 3
     items.sell_in -= 1
   elsif items.sell_in <= 10
     items.quality += 2
     items.sell_in -= 1
   end
  end

  def sulfuras
  end

end
