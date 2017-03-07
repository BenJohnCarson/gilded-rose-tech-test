class AgedBrie < DefaultItem
  def update
    @sell_in -= 1
    return if quality == MAX_QUALITY
    @quality += 1
    @quality += 1 if sell_in < 0 && quality < MAX_QUALITY
  end
end