class UsersController < ApplicationController
  before_action :set_user,           only: [:show, :edit, :update]
  before_action :authenticate_user!, only: [:edit, :update]

  def show
    @num_of_current_user_prototypes = @user.prototypes.size || 0
    @current_user_prototypes        = @user.prototypes.paginate(page: params[:page])
  end

  def edit

  end

  def update
    if @user.update(user_params)
      redirect_to root_path, notice: "edited your account in successfully."
    else
      render :edit
    end
  end

  private
  def set_user
    @user = User.find(params[:id])
  end

  def user_params
    params.require(:user).permit(:name, :email, :position, :profile, :occupation, :avatar)
  end
end
