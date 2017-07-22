class PrototypeDecorator < ApplicationDecorator
  delegate_all

  decorates :prototype
  decorates_association :user

  def posted_time
    object.created_at.strftime('%Y/%m/%d %H:%M:%S')
  end

  def main_image_path
    main_images = object.prototype_images.select { |image| image[:status] == 'main' }
    main_image_path = main_images.first.content.to_s || 'noimage-big.png'
  end

  def sub_images_paths
    sub_images = object.prototype_images.select { |image| image[:status] == 'sub' }
    sub_images.map{ |image| image.content.to_s }
  end

  def likes
    object.likes_count
  end	

  def user_name
    object.user.name
  end 

  def user_profile
    object.user.profile
  end
end
