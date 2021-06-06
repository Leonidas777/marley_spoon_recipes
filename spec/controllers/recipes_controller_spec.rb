require 'rails_helper'

describe RecipesController do
  let(:double_recipe) do
    double('Double recipe', title: 'Title 1', description: 'Description 1', tags: ['tag1'])
  end

  describe '#index' do
    before do
      allow(RecipeService).to receive(:get_all).and_return([double_recipe])
    end

    subject { get :index }

    it 'returns the recipes' do
      subject

      expect(assigns(:recipes)).to eq([double_recipe])
      expect(response).to have_http_status(:ok)
    end
  end

  describe '#show' do
    let(:params) { { id: '5jyueR32224maKGqIOYW6' } }

    before do
      allow(RecipeService).to receive(:get_by_id)
        .with('5jyueR32224maKGqIOYW6').and_return(double_recipe)
    end

    subject { get :show, params: params }

    it 'returns the recipe' do
      subject

      expect(assigns(:recipe)).to eq(double_recipe)
      expect(assigns(:tags)).to eq(['tag1'])
      expect(response).to have_http_status(:ok)
    end
  end
end
