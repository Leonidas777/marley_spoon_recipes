require 'rails_helper'

describe RecipeService do
  describe '#get_all' do
    subject { described_class.get_all }

    it 'returns the recipes' do
      VCR.use_cassette('get_all_recipes') do
        result = subject

        expect(result.is_a?(Contentful::Array)).to eq(true)
        expect(result.total).to eq(4)
        expect(result.skip).to eq(0)
        expect(result.limit).to eq(100)
        expect(result.first.title).to eq('White Cheddar Grilled Cheese with Cherry Preserves & Basil')
        expect(result.first.photo.url.starts_with?('//images.ctfassets.net/')).to eq(true)
      end
    end
  end

  describe '#get_by_id' do
    let(:id) { '5jy9hcidWcQ4maKGqIOYW6' }
    subject { described_class.get_by_id(id) }

    it 'returns the recipe' do
      VCR.use_cassette('get_recipe') do
        result = subject
        expect(result).to eq(nil)
      end
    end
  end
end
