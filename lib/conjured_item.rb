class ConjuredItem < DefaultItem
  def update
    @sell_in -= 1
    if quality <= 0
      @quality = 0
      return
    end
    @quality -= 2
    @quality -= 2 if sell_in < 0
  end
end