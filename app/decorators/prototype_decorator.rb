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

  def likes_num
    object.likes_count
  end

  def user_name
    object.user.name
  end

  def user_profile
    object.user.profile
  end

  def user_avatar
    object.user.avatar
  end

  def is_liked_current_user?
    object.likes.find_by(user_id: h.current_user)
  end

  def tags
    object.tags.pluck(:name)
  end
end
