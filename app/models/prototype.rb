class Prototype < ApplicationRecord
	belongs_to :user

	def posted_time
		created_at.strftime('%Y/%m/%d %H:%M:%S')
	end
end
