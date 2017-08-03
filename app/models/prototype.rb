# == Schema Information
#
# Table name: prototypes
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  catchcopy   :text(65535)
#  concept     :text(65535)
#  likes_count :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

class Prototype < ApplicationRecord
  # validation
  validates :name, :catchcopy, :concept, presence: true

  # pagination
  self.per_page = 8

  # association
  belongs_to :user
  has_many :prototype_images, dependent: :destroy
  has_many :likes, dependent: :destroy

  accepts_nested_attributes_for :prototype_images, allow_destroy: true, reject_if: :images_with_no_contents

  scope :recent, -> { order(created_at: :DESC) }

  def images_with_no_contents(attributed)
    attributed['content'].blank?
  end
end
