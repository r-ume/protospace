# == Schema Information
#
# Table name: prototype_images
#
#  id           :integer          not null, primary key
#  content      :string(255)
#  prototype_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  status       :integer
#

class PrototypeImage < ApplicationRecord
  # association
  belongs_to :prototype

  # enum
  enum status: %w(main sub)

  # carreierwave
  mount_uploader :content, PrototypeImageUploader

  # validation
  validates :content, :status, presence: true
end
