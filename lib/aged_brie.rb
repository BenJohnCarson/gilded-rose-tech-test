class AgedBrie < Item
  def update
    @sell_in -= 1
    return if quality == 50
    @quality += 1
    @quality += 1 if sell_in < 0 && quality < 50
  end
end