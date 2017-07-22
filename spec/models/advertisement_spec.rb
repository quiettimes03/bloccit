require 'rails_helper'

RSpec.describe Advertisement, type: :model do
  let(:advertisements) {Advertisement.create!(title: "New Ad Title", body: "New Ad Body", price: "New Ad Price")}

  describe "attributes" do
    it "has title, body, and price attributes" do
      expect(advertisements).to have_attributes(title: "New Ad Title", body: "New Ad Body", price: "New Ad Price")
    end
  end
end
