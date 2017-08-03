class Prototypes::NewestController < ApplicationController
  def index
    @prototypes = Prototype.eager_load(:user, :prototype_images).all.paginate(page: params[:page]).recent.decorate
    @filter_type = 'newest'
  end
end