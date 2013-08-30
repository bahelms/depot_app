require 'spec_helper'

describe Product do
  let(:product) { create(:product) }
  subject { product }

  it { should be_valid } 
end
