require 'rails_helper'

describe UsersController do

  let(:user) { create(:user) }

  describe '#index' do
    context 'when user has not signed in' do
      it 'redirects to sign in page' do
        get :index
        expect(response).to redirect_to(new_user_session_path)
      end
    end

    context 'when user has signed in' do
      before do
        sign_in user
      end

      it 'shows participants' do
        get :index
        expect(response).to be_success
      end
    end
  end
end
