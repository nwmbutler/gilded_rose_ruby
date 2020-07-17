require './lib/gilded_rose'
require './lib/item'

describe GildedRose do

  describe "#normal" do
    it "reduces @sell_in and @quality by 1" do
      items = Item.new('normal', 10, 4)
      gilRose = GildedRose.new(items)
      gilRose.normal
      expect(gilRose.items.quality).to eq 3
      expect(gilRose.items.sell_in).to eq 9
    end
  end

  describe "#normal" do
    it "reduces @quality by 2 when @sell_in is 0 " do
      items = Item.new('normal', 0, 4)
      gilRose = GildedRose.new(items)
      gilRose.normal
      expect(gilRose.items.quality).to eq 2
      expect(gilRose.items.sell_in).to eq -1
    end
  end

  describe "#aged_brie" do
    it "as @sell_in goes down @quality goes up " do
      items = Item.new('Aged Brie', 2, 4)
      gilRose = GildedRose.new(items)
      gilRose.aged_brie
      expect(gilRose.items.quality).to eq 5
      expect(gilRose.items.sell_in).to eq 1
    end
  end

  describe "#aged_brie" do
    it "@quality can not exceed 50" do
      items = Item.new('Aged Brie', 2, 50)
      gilRose = GildedRose.new(items)
      gilRose.aged_brie
      expect(gilRose.items.quality).to eq 50
      expect(gilRose.items.sell_in).to eq 1
    end
  end

  describe "#sulfuras" do
    it "@quality and @sell_in remain unchanged" do
      items = Item.new('Sulfuras', 2, 50)
      gilRose = GildedRose.new(items)
      gilRose.sulfuras
      expect(gilRose.items.quality).to eq 50
      expect(gilRose.items.sell_in).to eq 2
    end
  end

  describe "#backstage_pass" do
    it "@quality drops to 0 when sell_in reaches 0" do
      items = Item.new('backstage_pass', 0, 50)
      gilRose = GildedRose.new(items)
      gilRose.backstage_pass
      expect(gilRose.items.quality).to eq 0
      expect(gilRose.items.sell_in).to eq -1
    end
  end

  describe "#backstage_pass" do
    it "@quality increase by 2 when @sell_in <= 10" do
      items = Item.new('backstage_pass', 9, 10)
      gilRose = GildedRose.new(items)
      gilRose.backstage_pass
      expect(gilRose.items.quality).to eq 12
      expect(gilRose.items.sell_in).to eq 8
    end
  end

  describe "#backstage_pass" do
    it "@quality increase by 3 when @sell_in <= 5" do
      items = Item.new('backstage_pass', 4, 10)
      gilRose = GildedRose.new(items)
      gilRose.backstage_pass
      expect(gilRose.items.quality).to eq 13
      expect(gilRose.items.sell_in).to eq 3
    end
  end

end
