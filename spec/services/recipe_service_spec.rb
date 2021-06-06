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
        expect(result.limit).to eq(2)
        expect(result.first.title).to eq('Grilled Steak & Vegetables with Cilantro-Jalapeño Dressing')
        expect(result.first.photo.url.starts_with?('//images.ctfassets.net/')).to eq(true)
        expect(result.first.chef.name).to eq('Mark Zucchiniberg ')
      end
    end
  end

  describe '#get_by_id' do
    let(:id) { '5jyueR32224maKGqIOYW6' }

    subject { described_class.get_by_id(id) }

    it 'returns the recipe' do
      VCR.use_cassette('get_recipe') do
        result = subject

        expect(result.is_a?(Contentful::Entry)).to eq(true)
        expect(result.title).to eq('Tofu Saag Paneer with Buttery Toasted Pita')
        expect(result.photo.url.starts_with?('//images.ctfassets.net/')).to eq(true)
        expect(result.description.start_with?('Saag paneer is a popular Indian dish')).to eq(true)
      end
    end
  end
end
