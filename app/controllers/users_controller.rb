class UsersController < ApplicationController

	@@prototypes_per_page = 9

	def show
		@num_of_current_user_prototypes = current_user.prototypes.count ? current_user.prototypes.count : 0
		@current_user_prototypes        = current_user.prototypes ? current_user.prototypes: 'hoge'
	end
end
