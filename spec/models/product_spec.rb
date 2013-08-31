require 'spec_helper'

describe Product do
  let(:product) { create(:product) }
  subject { product }

  it { should be_valid } 
  it { should respond_to :title }
  it { should respond_to :description }
  it { should respond_to :price }
  it { should respond_to :image_url }

  describe "validations" do
    context "when title is not present" do
      before { subject.title = nil }
      it { should_not be_valid }
    end

    context "when description is not present" do
      before { subject.description = nil }
      it { should_not be_valid }
    end

    describe "price" do
      context "when over zero cents" do
        before { subject.price = 0.01 }
        it { should be_valid }
      end

      context "when it's not a positive number" do
        before { subject.price = 0 }
        it { should_not be_valid }
      end
      
      context "when not present" do
        before { subject.price = nil }
        it { should_not be_valid }
      end
    end

    describe "image url" do
      context "when not present" do
        before { subject.image_url = nil }
        it { should_not be_valid }
      end

      context "with invalid file type" do
        before { subject.image_url = 'foo.bar' }
        it { should_not be_valid }
      end
      
      context "with correct file type" do
        it "should be valid" do
          file_type = %w(.gif .jpg .png)
          file_type.each do |ext|
            subject.image_url = "foo#{ext}"
            expect(subject).to be_valid
          end
        end
      end
    end
  end
end
