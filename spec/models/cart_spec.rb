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
      # v1 = Vendor.create(title: 'apple')
      # p1 = Product.create(name: 'mac', sell_price: 100, list_price: 200, vendor: v1)

      p1 = FactoryBot.create(:product)
      cart.add_item(p1.id)

      expect(cart.items.first.product).to be_a Product
    end

    it "計算購物車總金額" do
      cart = Cart.new
      p1 = FactoryBot.create(:product, sell_price: 5)
      p2 = FactoryBot.create(:product, sell_price: 10)
      3.times{ cart.add_item(p1.id)}
      2.times{ cart.add_item(p2.id)}

      expect(cart.total_price).to eq 35
    end

    # it "聖誕節全面九折" do
    #   cart = Cart.new
    #   p1 = FactoryBot.create(:product, sell_price: 5)
    #   p2 = FactoryBot.create(:product, sell_price: 10)
    #   10.times{ cart.add_item(p1.id)}
    #   5.times{ cart.add_item(p2.id)}
      
    #   if christmas Time.local(2020, 12, 25)
    #     expect(cart.discount_price).to eq 90              
    #   else
    #     expect(cart.total_price).to eq 100        
    #   end
    # end
    # it "滿千送百" do
      
    # end
    # it "滿999免運費" do
      
    # end
  end

  context "進階功能" do
    it "將購物車的內容轉成 Hash 並存到 Session 裡" do
      cart = Cart.new
      p1 = create(:product)
      p2 = create(:product)

      4.times{ cart.add_item(p1.id) }
      2.times{ cart.add_item(p2.id) }

      expect(cart.serialize).to eq cart_hash
    end

    it "將存放在Session中{Hash}格式的內容，還原成購物車的內容" do
       cart = Cart.from_hash(cart_hash)

       expect(cart.items.first.quantity).to be 4
    end

    private
    def cart_hash
      {
        "items" => [
          {"product_id" => 1, "quantity" =>4 },
          {"product_id" => 2, "quantity" =>2 },
        ]
      }
    end
  end
end
