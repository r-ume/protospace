class Prototype < ApplicationRecord
	belongs_to :user
	has_many :prototype_images

 	self.per_page = 8
end
