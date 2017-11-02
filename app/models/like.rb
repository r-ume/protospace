# == Schema Information
#
# Table name: likes
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null
#  prototype_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Like < ApplicationRecord

  # Association
  belongs_to :user
  belongs_to :prototype, counter_cache: :likes_count

  # Validation
  validates :user_id, uniqueness: { scope: :prototype_id }
  validates :user_id, :prototype_id, presence: true, numericality: true

end
