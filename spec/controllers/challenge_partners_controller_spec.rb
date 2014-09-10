require 'rails_helper'

describe ChallengePartnersController do
  let(:challenge_partner) { build(:challenge_partner) }
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

    let!(:challenge_partner) { create(:challenge_partner) }

    context 'when user is not signed in' do
      it 'returns http success' do
        get :show, id: challenge_partner
        expect(response).to be_success
      end
    end

    context 'when user is signed in' do
      before do
        sign_in user
      end

      it 'returns http success' do
        get :show, id: challenge_partner
        expect(response).to be_success
      end
    end

    context 'when admin is signed in' do
      before do
        sign_in admin
      end

      it 'returns http success' do
        get :show, id: challenge_partner
        expect(response).to be_success
      end
    end
  end

  describe '#new' do
    context 'when user is not signed in' do
      it 'redirects to home page with an error' do
        get :new
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when user is signed in' do
      before do
        sign_in user
      end

      it 'redirects to home page with an error' do
        get :new
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when admin is signed in' do
      before do
        sign_in admin
      end

      it 'returns http success' do
        get :new
        expect(response).to be_success
      end
    end
  end

  describe '#edit' do

    let!(:challenge_partner) { create(:challenge_partner) }

    context 'when user is not signed in' do
      it 'redirects to home page with an error' do
        get :edit, id: challenge_partner
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when user is signed in' do
      before do
        sign_in user
      end

      it 'redirects to home page with an error' do
        get :edit, id: challenge_partner
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when admin is signed in' do
      before do
        sign_in admin
      end

      it 'returns http success' do
        get :edit, id: challenge_partner
        expect(response).to be_success
      end
    end
  end

  describe '#create' do
    context 'when user is not signed in' do
      it 'redirects to home page with an error' do
        post :create, challenge_partner: FactoryGirl.attributes_for(:challenge_partner)
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when user is signed in' do
      before do
        sign_in user
      end

      it 'redirects to home page with an error' do
        post :create, challenge_partner: FactoryGirl.attributes_for(:challenge_partner)
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when admin is signed in' do
      before do
        sign_in admin
      end

      it 'creates the record' do
        expect do
          post :create, challenge_partner: FactoryGirl.attributes_for(:challenge_partner)
        end.to change(ChallengePartner, :count).by(1)
      end
    end
  end

  describe '#update' do
    let!(:cp) { create(:challenge_partner, name: 'PBE') }

    context 'when user is not signed in' do
      it 'redirects to home page with an error' do
        put :update, id: cp, challenge_partner: FactoryGirl.attributes_for(:challenge_partner)
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when user is signed in' do
      before do
        sign_in user
      end

      it 'redirects to home page with an error' do
        put :update, id: cp, challenge_partner: FactoryGirl.attributes_for(:challenge_partner)
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when admin is signed in' do
      before do
        sign_in admin
      end

      it 'updates the record' do
        put :update, id: cp, challenge_partner: FactoryGirl.attributes_for(:challenge_partner, description: 'Testing update')
        expect(assigns(:challenge_partner).description).to eq 'Testing update'
      end
    end
  end

  describe '#destroy' do
    let!(:challenge_partner) { create(:challenge_partner) }

    context 'when user is not signed in' do
      it 'redirects to home page with an error' do
        delete :destroy, id: challenge_partner
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when user is signed in' do
      before do
        sign_in user
      end

      it 'redirects to home page with an error' do
        delete :destroy, id: challenge_partner
        expect(response).to redirect_to(root_path)
      end
    end

    context 'when admin is signed in' do
      before do
        sign_in admin
      end

      it 'deletes the record' do
        expect do
          delete :destroy, id: challenge_partner
        end.to change(ChallengePartner, :count).by(-1)
      end
    end
  end
end
