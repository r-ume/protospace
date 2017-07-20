class PrototypeImage < ApplicationRecord
	belongs_to :prototype

	enum status: %w(main sub)

	mount_uploader :content, PrototypeImageUploader

	validates :content, :status, presence: true
end
