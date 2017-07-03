module PrototypesHelper
	def display_image_of_prototype(prototype)
		image_path = "#{Rails.root}/public/images/#{prototype.image}"
		FileTest.exist?(image_path) ? image_tag(prototype.image) : image_tag('noimage-big.png')
	end	
end
