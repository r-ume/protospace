# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  text         :text(65535)      not null
#  user_id      :integer          not null
#  prototype_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class Comment < ApplicationRecord

  # Association
  belongs_to :user
  belongs_to :prototype

  # Validation
  validates :text, :user_id, :prototype_id, presence: true
  validates :user_id, :prototype_id, numericality: true

end
