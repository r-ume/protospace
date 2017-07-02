class Prototype < ApplicationRecord
	belongs_to :user

 	self.per_page = 8

	def posted_time
		created_at.strftime('%Y/%m/%d %H:%M:%S')
	end
end
