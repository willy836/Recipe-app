require 'rails_helper'
require 'rails-controller-testing'

RSpec.configure do |config|
  config.include FactoryBot::Syntax::Methods
end

RSpec.describe FoodsController, type: :controller do
  let(:user) { create(:user) }
  let(:food1) { create(:food, user:) }
  let(:food2) { create(:food, user:) }

  before { sign_in user }

  describe 'GET #index' do
    it 'returns a successful response' do
      get :index
      expect(response).to be_successful
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #new' do
    it 'returns a successful response' do
      get :new
      expect(response).to be_successful
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end

    it 'assigns a new food instance variable' do
      get :new
      expect(assigns(:food)).to be_a_new(Food)
    end
  end

  describe 'POST #create' do
    let(:valid_params) { { food: { name: 'Pizza', measurement_unit: 'grams', price: 10.99 } } }
    let(:invalid_params) { { food: { name: '', measurement_unit: '', price: '' } } }

    context 'with valid params' do
      it 'creates a new food' do
        expect do
          post :create, params: valid_params
        end.to change(Food, :count).by(1)
      end

      it 'redirects to the index page' do
        post :create, params: valid_params
        expect(response).to redirect_to(foods_path)
      end

      it 'sets a flash message' do
        post :create, params: valid_params
        expect(flash[:notice]).to eq('Food was successfully added.')
      end
    end

    context 'with invalid params' do
      it 'does not create a new food' do
        expect do
          post :create, params: invalid_params
        end.not_to change(Food, :count)
      end

      it 'renders the new template' do
        post :create, params: invalid_params
        expect(response).to render_template(:new)
      end

      it 'sets a flash message' do
        post :create, params: invalid_params
        expect(flash[:alert]).to eq('Failed to add food.')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the food' do
      food1
      expect do
        delete :destroy, params: { id: food1.id }
      end.to change(Food, :count).by(-1)
    end

    it 'redirects to the index page' do
      delete :destroy, params: { id: food1.id }
      expect(response).to redirect_to(foods_path)
    end

    it 'sets a flash message' do
      delete :destroy, params: { id: food1.id }
      expect(flash[:notice]).to eq('Food deleted successfully.')
    end
  end
end
