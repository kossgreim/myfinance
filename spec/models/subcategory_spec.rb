require 'rails_helper'

RSpec.describe Subcategory, type: :model do
  describe "validation" do
    context "invalid when" do

      it "has no name" do
        expect(build(:subcategory, name: nil)).to be_invalid
      end
      it "has no category" do
        expect(build(:subcategory, category: nil)).to be_invalid
      end

    end
    context "valid when" do

      it 'has valid factory' do
        expect(build(:subcategory)).to be_valid
      end

    end
  end
end
