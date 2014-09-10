require 'rails_helper'

describe ChallengesController do
  let(:challenge) { build(:challenge) }
  let(:user) { create(:user) }
  let(:admin) { create(:admin) }

  describe '#index' do
    context 'when user is not signed in' do
      it 'returns http success' do
        get :index
        expect(response).to be_success
      end

      it 'renders index template' do
        get :index
        expect(response).to render_template :index
      end
    end

    context 'when user is signed in' do
      before do
        sign_in user
      end

      it 'returns http success' do
        get :index
        expect(response).to be_success
      end

      it 'renders index template' do
        get :index
        expect(response).to render_template :index
      end
    end

    context 'when admin is signed in' do
      before do
        sign_in admin
      end

      it 'returns http success' do
        get :index
        expect(response).to be_success
      end

      it 'renders index template' do
        get :index
        expect(response).to render_template :index
      end
    end
  end

  describe '#show' do
    let!(:challenge) { create(:challenge) }

    context 'when user is not signed in' do
      it 'returns http success' do
        get :show, id: challenge
        expect(response).to be_success
      end
    end

    context 'when user is signed in' do
      before do
        sign_in user
      end

      it 'returns http success' do
        get :show, id: challenge
        expect(response).to be_success
      end
    end

    context 'when admin is signed in' do
      before do
        sign_in admin
      end

      it 'returns http success' do
        get :show, id: challenge
        expect(response).to be_success
      end
    end
  end

  describe '#create' do
    context 'when user is not signed in' do
      it 'redirects to home page with an error' do
        post :create, challenge: FactoryGirl.attributes_for(:challenge)
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when user is signed in' do
      before do
        sign_in user
      end

      it 'redirects to home page with an error' do
        post :create, challenge: FactoryGirl.attributes_for(:challenge)
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when admin is signed in' do
      before do
        sign_in admin
      end

      it 'creates the record' do
        post :create, challenge: FactoryGirl.attributes_for(:challenge, title: 'New challenge')
        expect(response).to_not redirect_to(root_path)
      end
    end
  end

  describe '#update' do
    let!(:cp) { create(:challenge, title: 'UNFCC + Ecofys') }

    context 'when user is not signed in' do
      it 'redirects to home page with an error' do
        put :update, id: cp, challenge: FactoryGirl.attributes_for(:challenge)
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when user is signed in' do
      before do
        sign_in user
      end

      it 'redirects to home page with an error' do
        put :update, id: cp, challenge: FactoryGirl.attributes_for(:challenge)
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when admin is signed in' do
      before do
        sign_in admin
      end

      it 'updates the record' do
        put :update, id: cp, challenge: FactoryGirl.attributes_for(:challenge, description: 'Testing update')
        expect(assigns(:challenge).description).to eq 'Testing update'
      end
    end
  end

  describe '#destroy' do
    let!(:challenge) { create(:challenge) }

    context 'when user is not signed in' do
      it 'redirects to home page with an error' do
        delete :destroy, id: challenge
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when user is signed in' do
      before do
        sign_in user
      end

      it 'redirects to home page with an error' do
        delete :destroy, id: challenge
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when admin is signed in' do
      before do
        sign_in admin
      end

      it 'deletes the record' do
        expect do
          delete :destroy, id: challenge
        end.to change(Challenge, :count).by(-1)
      end
    end
  end
end
