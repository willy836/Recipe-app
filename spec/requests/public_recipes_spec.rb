
RSpec.describe 'PublicRecipes', type: :request do
  describe 'GET /index' do
    it 'returns http success' do
      get public_recipes_path
      expect(response).to have_http_status(:success)
    end
  end
end
