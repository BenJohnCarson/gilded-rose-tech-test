describe BackstagePass do
  subject(:pass)  { described_class.new("Backstage passes to a TAFKAL80ETC concert", 11, 10) }

  let(:rose)      { GildedRose.new([pass]) }
  
  describe "#update" do
    context "sell_in > 10" do
      before do
        rose.update_quality
      end
      
      it "decreases sell_in by 1" do
        updated_item = rose.items.pop
        expect(updated_item.sell_in).to eq 10
      end
      
      it "increases quality by 1" do
        updated_item = rose.items.pop
        expect(updated_item.quality).to eq 11
      end
    end
      
    context "sell_in < 10" do
      before do
        2.times { rose.update_quality }
      end
      
      it "increases quality by 2" do
        updated_item = rose.items.pop
        expect(updated_item.quality).to eq 13
      end
    end
        
    context "sell_in < 5" do
      before do
        7.times { rose.update_quality }
      end
      
      it "increases quality by 3" do
        updated_item = rose.items.pop
        expect(updated_item.quality).to eq 24
      end
    end
          
    context "sell_in < 0" do
      before do
        12.times { rose.update_quality }
      end
      
      it "quality is 0" do
        updated_item = rose.items.pop
        expect(updated_item.quality).to eq 0
      end
    end
  
    let(:expensive_pass)  { described_class.new("Backstage passes to a TAFKAL80ETC concert", 5, 49) }
    let(:rose2)      { GildedRose.new([expensive_pass]) }
    
    it "can't go above 50 quality" do
      2.times { rose2.update_quality }
      updated_item = rose2.items.pop
      expect(updated_item.quality).to eq 50
    end
  end
end