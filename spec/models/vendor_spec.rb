require 'rails_helper'

RSpec.describe Vendor, type: :model do
  context "驗證廠商名稱" do
    it "有寫" do
      vendor = Vendor.new(title: 'Mcdonald' )
      expect(vendor).to be_valid
    end

    it "沒寫" do
      vendor = Vendor.new
      expect(vendor).not_to be_valid
    end
  end

end
