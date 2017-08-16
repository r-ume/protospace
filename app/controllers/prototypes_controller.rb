class PrototypesController < ApplicationController
  before_action :authenticate_user!,          except: [:index, :show]
  before_action :set_prototype,               only:   [:show, :edit, :update, :destroy]
  before_action :set_tag_default_placeholder, only:   [:new, :create, :edit, :update]

  def index
    @prototypes = Prototype.eager_load(:user, :prototype_images).all.paginate(page: params[:page]).decorate
    @filter_type = 'normal'
  end

  def show
    @comment = Comment.new
    @comments = @prototype.comments.includes(:user)
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
  def set_prototype
    @prototype = Prototype.find(params[:id]).decorate
  end

  def set_tag_default_placeholder
    @tag_default_placeholders = ["Web Design", "UI", "Application"]
  end

  def prototype_params
    params.require(:prototype)
        .permit(:name,
                :catchcopy,
                :concept,
                prototype_images_attributes: [:id, :content, :status])
        .merge(tag_list: tag_params)
  end

  def tag_params
    params.require(:prototype).permit(:tag_list)
  end
end
