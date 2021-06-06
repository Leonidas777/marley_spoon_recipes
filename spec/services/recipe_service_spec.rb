require 'rails_helper'

describe RecipeService do
  describe '#get_all' do
    subject { described_class.get_all }

    it 'returns the recipes' do
      expect(subject).to eq([])
    end
  end

  describe '#get_by_id' do
    let(:id) { '234' }
    subject { described_class.get_by_id(id) }

    it 'returns the recipe' do
      expect(subject).to eq(nil)
    end
  end
end
