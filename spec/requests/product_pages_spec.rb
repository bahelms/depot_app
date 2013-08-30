require 'spec_helper'

describe "Product pages" do
  subject { page }

  describe "index" do
    before { visit products_path }
    it { should have_content("Listing Products") }
  end
end
