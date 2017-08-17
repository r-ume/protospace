require 'rails_helper'

describe PrototypesController, type: :controller do
  describe 'with user login' do
    before { login_user }

    let(:prototype)      { create(:prototype) }
    let(:prototype_name) { Faker::HarryPotter.book}
    let(:valid_params)   { { id: prototype.id, prototype: attributes_for(:prototype, name: prototype_name) } }
    let(:invalid_params) { { id: prototype.id, prototype: attributes_for(:prototype, name: nil) } }

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

    context 'GET #show' do
      before do
        get :show, params: { id: prototype.id }
      end

      it 'assigns the requested prototype to prototype' do
        expect(assigns(:prototype)).to eq prototype
      end

      it 'expects the requested prototype to be decorated with PrototypeDecorator' do
        expect(assigns(:prototype)).to be_decorated_with PrototypeDecorator
      end

      it 'assigns the requested comment to a new instance of comment' do
        expect(assigns(:comment)).to be_a_new(Comment)
      end

      it 'renders the :show template' do
        expect(response).to render_template :show
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

    context 'POST #create' do
      context 'with valid_params' do
        before do
          post :create, params: valid_params
        end

        it 'creates a new prototype' do
          expect {
            post :create, params: valid_params
          }.to change(Prototype, :count).by(1)
        end

        it 'redirects to root path' do
          expect(response).to redirect_to root_path
        end

        it 'shows the successful flash message' do
          expect(flash[:notice]).to eq 'Prototype was successfully created.'
        end
      end

      context 'with invalid_params' do
        before do
          post :create, params: invalid_params
        end

        it 'creates a new prototype' do
          expect {
            post :create, params: invalid_params
          }.not_to change(Prototype, :count)
        end

        it 'redirects to root path' do
          expect(response).to render_template :new
        end

        it 'shows the successful flash message' do
          expect(flash[:alert]).to eq 'Prototype was not successfully created.'
        end
      end
    end

    context 'GET #edit' do
      before do
        get :edit, params: { id: prototype.id }
      end

      it 'assigns the requested prototype to prototype' do
        expect(assigns(:prototype)).to eq prototype
      end

      it 'expects the requested prototypes to be decorated with PrototypeDecorator' do
        expect(assigns(:prototype)).to be_decorated_with PrototypeDecorator
      end

      it 'renders the :edit template' do
        expect(response).to render_template :edit
      end
    end

    context 'PATCH #update' do
      before do
        patch :update, params: valid_params
      end

      it 'assigns the requested prototype to prototype' do
        expect(assigns(:prototype)).to eq prototype
      end

      it 'expects the requested prototypes to be decorated with PrototypeDecorator' do
        expect(assigns(:prototype)).to be_decorated_with PrototypeDecorator
      end

      it 'updates prototype' do
        prototype.reload
        expect(prototype.name).to eq prototype_name
      end

      it 'redirects to root_path'  do
        expect(response).to redirect_to root_path
      end

      it 'shows flash message to show update prototype successfully' do
        expect(flash[:notice]).to eq 'Prototype was successfully updated.'
      end
    end
  end
end
