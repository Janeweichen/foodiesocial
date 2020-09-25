require 'rails_helper'

RSpec.describe Cart, type: :model do
  context "基本功能" do
    it "把商品丟入購物車裡，購物車裡有這項商品" do
      cart = Cart.new
      cart.add_item(3)
      expect(cart.empty?).to be false
    end

    it "同一種商品，增加時，只增加數量，不增加項目" do
      cart = Cart.new
      5.times { cart.add_item(1) }
      3.times { cart.add_item(3) }

      expect(cart.items.count).to be 2
      expect(cart.items.first.quantity).to be 5
    end

    it "商品可以放進及拿出購物車" do
      cart = Cart.new
      v1 = Vendor.create(title: 'apple')
      p1 = Product.create(name: 'mac', sell_price: 100, list_price: 200, vendor: v1)

      cart.add_item(p1.id)

      expect(cart.items.first.product).to be_a Product


    end
  end

  context "進階功能" do
    
  end
end
