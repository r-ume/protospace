class PrototypeDecorator < ApplicationDecorator
  delegate_all

  decorates :prototype
  decorates_association :user

  def posted_time
    object.created_at.strftime('%Y/%m/%d %H:%M:%S')
  end

  def main_image
    object.prototype_images.main.first.content
  end

  def sub_images
    object.prototype_images.sub
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
