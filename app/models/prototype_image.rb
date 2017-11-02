# == Schema Information
#
# Table name: prototype_images
#
#  id           :integer          not null, primary key
#  content      :string(255)      default(""), not null
#  status       :integer          not null
#  prototype_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class PrototypeImage < ApplicationRecord

  # Enum
  enum status: { main: 1, sub: 2 }

  # Association
  belongs_to :prototype

  # Validation
  validates :content, :status, :prototype_id,  presence: true
  validates :prototype_id,                     numericality: true
  validate  :only_one_main_image_per_prototype

  # Carreierwave
  mount_uploader :content, PrototypeImageUploader

  # Custom Validation
  def only_one_main_image_per_prototype
    main_image = self.prototype.prototype_images.main
    errors.add(:status, "Main Image for this Prototype has already exists.") if main_image.present?
  end

end
