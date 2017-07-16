class Prototype < ApplicationRecord
	# validation
	validates :name, :catchcopy, :concept, presence: true

	# pagination
 	self.per_page = 8

 	# association
	belongs_to :user
	has_many :prototype_images, dependent: :destroy

	accepts_nested_attributes_for :prototype_images, allow_destroy: true, reject_if: :rejected_images

	def rejected_images(attributed)
		attributed['content'].blank?
	end

end
