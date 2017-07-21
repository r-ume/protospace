class PrototypeDecorator < ApplicationDecorator
	delegate_all

	decorates :prototype
	decorates_association :user
	decorates_association :prototype_images

	def posted_time
		object.created_at.strftime('%Y/%m/%d %H:%M:%S')
	end

	def image
		for image in object.prototype_images
			if image[:status] == 'main' || 0
				image_path = "#{Rails.root}/public/uploads/#{image.content}"
			end
		end

		FileTest.exist?(image_path) ? h.image_tag(image_path) : h.image_tag('noimage-big.png')
	end	
end
