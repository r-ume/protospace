class Comment < ApplicationRecord
  # columns
  # text, user_id, prototype_id

  # association
  belongs_to :user
  belongs_to :prototype
end