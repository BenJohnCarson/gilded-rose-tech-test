describe ConjuredItem do
  subject(:item)  { described_class.new("magic", 5, 15) }
  
  let(:rose)      { GildedRose.new([item]) }
  
  describe "#update" do
    context "sell_in is > 0" do
      before do
        rose.update_quality
      end
      
      it "decreases sell_in by 1" do
        updated_item = rose.items.pop
        expect(updated_item.sell_in).to eq 4
      end
      
      it "decreases quality by 2" do
        updated_item = rose.items.pop
        expect(updated_item.quality).to eq 13
      end
    end
    
    context "sell_in is < 0" do
      before do
        6.times { rose.update_quality }
      end
      
      it "decreases quality by 4" do
        updated_item = rose.items.pop
        expect(updated_item.quality).to eq 1
      end
      
      it "can't go into negative quality" do
        2.times { rose.update_quality }
        updated_item = rose.items.pop
        expect(updated_item.quality).to eq 0
      end
    end
  end
end