require_relative 'item'
require_relative 'default_item'
require_relative 'normal_item'
require_relative 'aged_brie'
require_relative 'backstage_pass'

class GildedRose
  
  attr_reader :items
  
  def initialize(items)
    @items = items
  end

  def update_quality
    @items.each do |item|
      item.update
    end
  end
end
