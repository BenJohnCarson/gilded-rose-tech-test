class NormalItem < DefaultItem
  def update
    @sell_in -= 1
    return if quality == 0
    @quality -= 1
    @quality -= 1 if past_sell_by?
  end
  
  private
  
  def past_sell_by?
    sell_in < 0 && quality > 0
  end
end