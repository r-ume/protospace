class PrototypesController < ApplicationController
  def index
    @prototypes = Prototype.includes(:user).all
  end

  def new
    @prototype = Prototype.new
    @prototype.prototype_images.build
  end

  def create
    @prototype = Prototype.new(prototype_params)

    respond_to do |format|
      if @prototype.save
        format.html { redirect_to :root, notice: 'Prototype was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  private
  def prototype_params
    params.require(:prototype)
      .permit(:name, :catchcopy, :concept, prototype_images_attributes: [:id, :content, :status])
      .merge(user_id: current_user.id)
  end
end
