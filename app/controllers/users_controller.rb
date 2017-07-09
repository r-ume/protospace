class UsersController < ApplicationController
	before_action :set_user, only: [:show, :edit, :update]

	def show
		@num_of_current_user_prototypes = @user.prototypes.size || 0
		@current_user_prototypes        = @user.prototypes.paginate(page: params[:page]).decorate
	end

	def edit
		
	end

	def update
		@user.update(user_params)
		redirect_to :root
	end

	private
	def set_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:name, :email, :position, :profile, :occupation)
	end
end
