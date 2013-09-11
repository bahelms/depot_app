require 'spec_helper'

describe LineItem do
  let(:line_item) { create(:line_item) }
  subject { line_item }

  it { should respond_to(:price) }
  it { should respond_to(:quantity) }
  it { should respond_to(:cart) }
  it { should respond_to(:product) }
end
