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

      it 'expects the requested prototypes to be decorated with PaginatingDecorator' do
        expect(assigns(:prototypes)).to be_decorated_with PaginatingDecorator
      end

      it "assigns the requested prototype to 'normal'" do
        expect(assigns(:filter_type)).to eq 'normal'
      end

      it 'renders the :index template' do
        expect(response).to render_template :index
      end
    end

    context 'GET #new' do
      before do
        get :new
      end

      it 'assigns the requested prototype to a new instance of prototype' do
        expect(assigns(:prototype)).to be_a_new(Prototype)
      end
      
      it 'renders the :new template' do
        expect(response).to render_template :new
      end
    end
  end
end
