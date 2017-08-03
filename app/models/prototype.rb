class Prototype < ApplicationRecord
  # properties
  # name, catchcopy, concept, likes_count

  # validation
  validates :name, :catchcopy, :concept, presence: true

  # pagination
  self.per_page = 8

  # association
  belongs_to :user
  has_many :prototype_images, dependent: :destroy
  has_many :comments, dependent: :destroy

  accepts_nested_attributes_for :prototype_images, allow_destroy: true, reject_if: :images_with_no_contents

  def images_with_no_contents(attributed)
    attributed['content'].blank?
  end
end
