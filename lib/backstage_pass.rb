class BackstagePass < DefaultItem
  
  FIRST_INCREASE = 10
  SECOND_INCREASE = 5
  
  def update
    @sell_in -= 1
    return if quality == MAX_QUALITY
    return @quality = 0 if sell_in < 0
    @quality += 1
    @quality += 1 if first_increase?
    @quality += 1 if second_increase?
  end
  
  private
  
  def first_increase?
    sell_in < FIRST_INCREASE && quality < MAX_QUALITY
  end
  
  def second_increase?
    sell_in < SECOND_INCREASE && quality < (MAX_QUALITY - 1)
  end
end
