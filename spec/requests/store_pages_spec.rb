require 'spec_helper'

describe "Store pages" do
  subject { page }

  describe "index" do
    before { visit store_path }
    it { should have_content("Your Pragmatic Catalog") }
  end
end
