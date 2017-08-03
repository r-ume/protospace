class CommentsController < ApplicationController
  def create
    current_user.comments.create(create_params)

    @prototype = Prototype.find(params[:prototype_id])
    @comments = @prototype.comments.includes(:user)
  end

  private
  def create_params
    params.require(:comment).permit(:text).merge(prototype_id: params[:prototype_id])
  end
end