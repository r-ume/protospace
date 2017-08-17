require 'rails_helper'

describe PrototypesController, type: :controller do
  describe 'with user login' do
    before { login_user }
    let(:prototype) { create(:prototype) }

    context 'GET #index' do
      before do
        get :index
      end

      it 'assigns the requested prototypes to prototype' do
        expect(assigns(:prototypes)).to include prototype
      end

      it 'expect the requested prototypes to be decorated with PaginatingDecorator' do
        expect(assigns(:prototypes)).to be_decorated_with PaginatingDecorator
      end
    end
  end
end
