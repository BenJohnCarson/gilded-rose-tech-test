require_relative 'item'
require_relative 'normal_item'
require_relative 'aged_brie'

class GildedRose
  
  attr_reader :items
  
  def initialize(items)
    @items = items
  end

  def update_quality()
    @items.each do |item|
      # return update_brie(item) if item.name == "Aged Brie"
      return update_sulfuras(item) if item.name == "Sulfuras, Hand of Ragnaros"
      return update_pass(item) if item.name == "Backstage passes to a TAFKAL80ETC concert"
      return item.update
    end
  end
  
  # def update_brie(item)
  #   item.sell_in -= 1
  #   return if item.quality == 50
  #   item.quality += 1
  #   item.quality += 1 if item.sell_in < 0 && item.quality < 50
  # end
  
  def update_sulfuras(item)
  end
  
  def update_pass(item)
    item.sell_in -= 1
    return if item.quality == 50
    return item.quality = 0 if item.sell_in < 0
    item.quality += 1
    item.quality += 1 if item.sell_in < 10 && item.quality < 50
    item.quality += 1 if item.sell_in < 5 && item.quality < 49
  end
end
