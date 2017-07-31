class PrototypeImage < ApplicationRecord

  # properties
  # content, status

  # association
  belongs_to :prototype

  # enum
  enum status: %w(main sub)

  # carreierwave
  mount_uploader :content, PrototypeImageUploader

  # validation
  validates :content, :status, presence: true
end
