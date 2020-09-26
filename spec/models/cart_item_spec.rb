require 'rails_helper'

RSpec.describe CartItem, type: :model do
  it "計算每個CartItem自己的金額" do
    cart = Cart.new
    p1 = FactoryBot.create(:product, sell_price: 5)
    p2 = FactoryBot.create(:product, sell_price: 10)
    3.times { cart.add_item(p1.id) }
    2.times { cart.add_item(p2.id) }

    expect(cart.items.first.total_price).to eq 15
    expect(cart.items.last.total_price).to eq 20
  end
end
