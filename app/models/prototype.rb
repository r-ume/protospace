# == Schema Information
#
# Table name: prototypes
#
#  id          :integer          not null, primary key
#  name        :string(255)      default(""), not null
#  user_id     :integer          not null
#  catchcopy   :text(65535)      not null
#  concept     :text(65535)      not null
#  likes_count :integer          default(0), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Prototype < ApplicationRecord

  # Pagination
  self.per_page = 8

  # Scope
  scope :newest,  -> { order(created_at: :DESC) }
  scope :popular, -> { order(likes_count: :DESC) }

  # Association
  belongs_to :user
  has_many :prototype_images, dependent: :destroy
  has_many :comments,         dependent: :destroy
  has_many :likes,            dependent: :destroy

  accepts_nested_attributes_for :prototype_images, allow_destroy: true, reject_if: :images_with_no_contents

  # Validation
  validates :name, :catchcopy, :concept, presence: true

  # Acts as Taggale Gem
  acts_as_taggable_on :tags

  def images_with_no_contents(attributed)
    attributed['content'].blank?
  end
end
