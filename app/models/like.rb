# == Schema Information
#
# Table name: likes
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  prototype_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Like < ApplicationRecord
  # association
  belongs_to :user
  belongs_to :prototype, counter_cache: :likes_count
end