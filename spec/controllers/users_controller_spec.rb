require 'rails_helper'

describe UsersController do
  let(:user)      { create(:user) }
  let(:user_name) { Faker::Pokemon.name }
  let(:params)    { { id: user.id, user: attributes_for(:user, name: user_name ) } }

  describe 'with user login' do
    before { login_user }

    context 'GET #show' do
      before :each do
        get :show, params: { id: user.id }
      end

      it 'assigns the requested user to @user' do
        expect(assigns(:user)).to eq user
      end

      it 'assigns the num of prototypes associated with user to @num_of_current_user_prototypes' do
        expect(assigns(:num_of_current_user_prototypes).size).to  be_a_kind_of(Integer)
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

    context 'PATCH #update' do
      before :each do
        patch :update, params: params
      end

      it 'assigns the requested user to @user' do
        expect(assigns(:user)).to eq user
      end

      it 'changes @user\'s attributes' do
        user.reload
        expect(user.name).to eq user_name
      end

      it 'redirects to root path' do
        expect(response).to redirect_to root_path
      end

      it 'sends flash messages' do
        expect(flash[:notice]).to eq 'edited your account in successfully.'
      end
    end
  end

  describe 'without user login' do
    context 'GET #show' do
      before :each do
        get :show, params: { id: user.id }
      end

      it 'assigns the requested user to @user' do
        expect(assigns(:user)).to eq user
      end

      it 'renders :show template' do
        expect(response).to render_template :show
      end
    end

    context 'GET #edit' do
      it 'redirects to user show page' do
        get :edit, params: { id: user.id }
        expect(response).to redirect_to new_user_session_path
      end
    end

    context 'GET #edit' do
      it 'redirect to login page' do
        patch :update, params: { id: user.id }
        expect(response).to redirect_to new_user_session_path
      end
    end
  end
end
