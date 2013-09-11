require "spec_helper"

describe "Cart pages" do
  subject { page }
  let(:cart) { create(:cart) }

  describe "cart contents page" do
    before { visit cart_path(cart) }

    it { should have_content("Your Pragmatic Cart") }
  end
end
