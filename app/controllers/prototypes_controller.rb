class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show, :edit, :update]
  before_action :set_prototype,      only:   [:edit, :update]

  def index
    @prototypes = Prototype.eager_load(:user, :prototype_images).all.paginate(page: params[:page]).decorate
  end

  def show
    @prototype = Prototype.find(params[:id]).decorate
  end 

  def new
    @prototype = Prototype.new
    @prototype.prototype_images.build
  end

  def create
    @prototype = current_user.prototypes.new(prototype_params)

    if @prototype.save
      flash[:notice] = 'Prototype was successfully created.'
      redirect_to root_path
    else
      flash[:alert] = 'Prototype was not successfully created.'
      render :new
    end
  end

  def edit

  end

  def update
    if @prototype.update(prototype_params)
      flash[:notice] = 'Prototype was successfully updated.'
      redirect_to root_path
    else
      flash[:alert] = 'Prototype was not updated.'
      render :edit
    end
  end

  private
  def prototype_params
    params.require(:prototype)
      .permit(:name, :catchcopy, :concept, prototype_images_attributes: [:id, :content, :status])
  end

  def set_prototype
    @prototype = Prototype.find(params[:id])
  end 
end
