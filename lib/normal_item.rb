class NormalItem < Item
  def update
    @sell_in -= 1
    return if quality == 0
    @quality -= 1
    @quality -= 1 if sell_in < 0 && quality > 0
  end
end