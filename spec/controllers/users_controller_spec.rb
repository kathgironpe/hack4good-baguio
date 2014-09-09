require 'rails_helper'

describe UsersController do
  describe '#index' do
    it 'returns http success' do
      get :index
      expect(response).to redirect_to(sign_in_path)
    end
  end
end
