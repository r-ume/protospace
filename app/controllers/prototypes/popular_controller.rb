class Prototypes::PopularController < ApplicationController
  def index
    @prototypes = Prototype.eager_load(:user, :prototype_images).all.paginate(page: params[:page]).popular.decorate
    @filter_type = 'popular'
  end
end