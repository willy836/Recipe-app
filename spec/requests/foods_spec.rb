require 'rails_helper'

# RSpec.describe FoodsController, type: :request do
#   describe 'GET #index' do
#     let(:user) { FactoryBot.create(:user) } 
#     let(:food) { FactoryBot.create(:food, user: user) } 
#     before do
#       sign_in user 
#       get foods_path 
#     end

#     it 'returns http successs' do
#       expect(response).to have_http_status(:success)
#     end

#     it 'renders index template' do
#       expect(response).to render_template(:index)
#     end
#   end
# end
RSpec.describe FoodsController, type: :controller do
    let(:user) { create(:user) }
    let(:food1) { create(:food, user: user) }
    let(:food2) { create(:food, user: user) }
  
    before { sign_in user }
  
    describe "GET #index" do
      it "returns a successful response" do
        get :index
        expect(response).to be_successful
      end
  
      it "assigns the user's foods to @foods" do
        get :index
        expect(assigns(:foods)).to match_array([food1, food2])
      end
  
      it "renders the index template" do
        get :index
        expect(response).to render_template(:index)
      end
    end
  end
