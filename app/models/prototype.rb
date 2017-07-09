class Prototype < ApplicationRecord
	belongs_to :user

 	self.per_page = 8
end
