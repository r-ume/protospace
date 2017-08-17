require 'rails_helper'

describe UsersController do
  let(:user)   { create(:user) }
  let(:params) { { id: user.id, user: attributes_for(:user, name: Faker::Pokemon.name ) } }

  describe 'with user login' do
    before { login_user }

    context 'GET #show' do
      before :each do
        get :show, params: { id: user.id }
      end

      it 'assigns the requested to @user' do
        expect(assigns(:user)).to eq user
      end

      it 'renders the :show templates' do
        expect(response).to render_template :show
      end
    end

    context 'GET #edit' do
      before :each do
        get :edit, params: { id: user.id }
      end

      it 'assigns the requested user to @user' do
        expect(assigns(:user)).to eq user
      end

      it 'renders the :edit template' do
        expect(response).to render_template :edit
      end
    end
  end
end
