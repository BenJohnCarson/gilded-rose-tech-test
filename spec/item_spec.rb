require 'gilded_rose'

describe Item do
  subject(:item)      { described_class.new("item", 5, 10) }

  let(:rose)      { GildedRose.new([item]) }
  
  describe "#update_quality" do
    context "one day has passed" do
      before do
        rose.update_quality
      end
      
      it "decreases sell_in by 1" do
        updated_item = rose.items.pop
        expect(updated_item.sell_in).to eq 4
      end
      
      it "decreases quality by 1" do
        updated_item = rose.items.pop
        expect(updated_item.quality).to eq 9
      end
    end
    
    context "six days have passed" do
      before do
        6.times { rose.update_quality }
      end
      
      it "decreases quality by 2" do
        updated_item = rose.items.pop
        expect(updated_item.quality).to eq 3
      end
      
      it "can't go into negative quality" do
        2.times { rose.update_quality }
        updated_item = rose.items.pop
        expect(updated_item.quality).to eq 0
      end
    end
  end
end
