class TagsController < ApplicationController
  def index
    @tags = ActsAsTaggableOn::Tag.most_used
  end

  def show
    @tag = ActsAsTaggableOn::Tag.find_by(name: params[:tag_name])
    @prototypes = Prototype.tagged_with(@tag).order(likes_count: :desc).paginate(page: params[:page]).decorate
  end
end
