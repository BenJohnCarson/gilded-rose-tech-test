describe "Sulfuras" do
  subject(:sulfuras)  { Item.new("Sulfuras, Hand of Ragnaros", 5, 10) }

  let(:rose)      { GildedRose.new([sulfuras]) }
  
  describe "#update_quality" do
    context "one day has passed" do
      before do
        rose.update_quality
      end
      
      it "sell_in unchanged" do
        updated_item = rose.items.pop
        expect(updated_item.sell_in).to eq 5
      end
      
      it "quality unchanged" do
        updated_item = rose.items.pop
        expect(updated_item.quality).to eq 10
      end
    end
    
    context "six days have passed" do
      before do
        6.times { rose.update_quality }
      end
      
      it "sell_in unchanged" do
        updated_item = rose.items.pop
        expect(updated_item.sell_in).to eq 5
      end
      
      it "quality unchanged" do
        updated_item = rose.items.pop
        expect(updated_item.quality).to eq 10
      end
    end
  end
end