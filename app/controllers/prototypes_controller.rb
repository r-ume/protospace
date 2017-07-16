class PrototypesController < ApplicationController
  before_action :authenticate_user!, except: [:index] 

  def index
    @prototypes = Prototype.includes(:user).all
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
      redirect_to new_prototype_path
    end
  end

  private
  def prototype_params
    params.require(:prototype)
      .permit(:name, :catchcopy, :concept, prototype_images_attributes: [:id, :content, :status])
  end
end
