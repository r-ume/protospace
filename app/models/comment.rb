# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  text         :text(65535)      not null
#  user_id      :integer
#  prototype_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Comment < ApplicationRecord
  # association
  belongs_to :user
  belongs_to :prototype
end
