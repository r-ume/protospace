module PrototypesHelper
	def displayImageOfPrototype(prototype)
		image_path = "#{Rails.root}/public/images/#{prototype.image}"
		FileTest.exist?(image_path) ? image_tag(prototype.image) : image_tag('noimage-big.png')
	end	
end
