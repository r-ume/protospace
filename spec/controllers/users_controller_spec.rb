require 'rails_helper'

describe UsersController do
  let(:user)   { create(:user) }
  let(:params) { { id: user.id, user: attributes_for(:user, name: Faker::Pokemon.name ) } }

  describe 'with user login' do
    before { login_user }

    before :each do
      get :show, params: { id: user.id }
    end

    context 'GET #show' do
      it 'assigns the requested to @user' do
        expect(assigns(:user)).to eq user
      end

      it 'renders the :show templates' do
        expect(response).to render_template :show
      end
    end
  end
end
