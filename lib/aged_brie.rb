class AgedBrie < DefaultItem
  def update
    @sell_in -= 1
    return if quality == MAX_QUALITY
    @quality += 1
    @quality += 1 if past_sell_by?
  end
  
  private
  
  def past_sell_by?
    sell_in < 0 && quality < MAX_QUALITY
  end
end