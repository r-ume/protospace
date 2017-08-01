class LikesController < ApplicationController
  before_action :set_prototype, only: [:create, :destroy]

  def create
    binding.pry
    @like = @prototype.likes.create(user_id: current_user.id)
  end

  def destroy

  end

  private
  def set_prototype
    @prototype = Prototype.find(params[:prototype_id])
  end
end
