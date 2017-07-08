class PrototypeDecorator < ApplicationDecorator
  delegate_all
  
  decorates :prototype
  decorates_association :user 

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

 	def posted_time
		object.created_at.strftime('%Y/%m/%d %H:%M:%S')
	end

	def display_image_of_prototype
		image_path = "#{Rails.root}/public/images/#{object.image}"
		FileTest.exist?(image_path) ? h.image_tag(object.image) : h.image_tag('noimage-big.png')
	end	
 
end
