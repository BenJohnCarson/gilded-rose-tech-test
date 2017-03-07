describe "Aged Brie" do
  subject(:brie)  { Item.new("Aged Brie", 3, 40) }

  let(:rose)      { GildedRose.new([brie]) }
  
  describe "#update_quality" do
    context "one day has passed" do
      before do
        rose.update_quality
      end
      
      it "decreases sell_in by 1" do
        updated_item = rose.items.pop
        expect(updated_item.sell_in).to eq 2
      end
      
      it "increases quality by 1" do
        updated_item = rose.items.pop
        expect(updated_item.quality).to eq 41
      end
    end
    
    context "four days have passed" do
      before do
        4.times { rose.update_quality }
      end
      
      it "increases quality by 2" do
        updated_item = rose.items.pop
        expect(updated_item.quality).to eq 45
      end
      
      it "can't go above 50 quality" do
        3.times { rose.update_quality }
        updated_item = rose.items.pop
        expect(updated_item.quality).to eq 50
      end
    end
  end
end