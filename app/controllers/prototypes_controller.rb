class PrototypesController < ApplicationController
  before_action :authenticate_user!,          except: [:index, :show, :edit, :update]
  before_action :set_prototype,               only:   [:show, :edit, :update, :destroy]
  before_action :set_tag_default_placeholder, only:   [:new, :create, :edit, :update]

  def index
    @prototypes = Prototype.eager_load(:user, :prototype_images).all.paginate(page: params[:page]).decorate
  end

  def show

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

  def destroy
    if @prototype.user == current_user
      @prototype.destroy
      redirect_to root_path, notice: "Prototype was successfully updated"
    else
      render :index, alert: "You cannot destroy the prototype"
    end
  end

  private
  def prototype_params
    params.require(:prototype)
      .permit(:name, :catchcopy, :concept, :tag_list, prototype_images_attributes: [:id, :content, :status])
  end

  def set_prototype
    @prototype = Prototype.find(params[:id]).decorate
  end

  def set_tag_default_placeholder
    @tag_default_placeholder = ["Web Design", "UI", "Application"]
  end
end
