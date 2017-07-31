class Like < ApplicationRecord
  # columns
  # user_id, prototype_id

  # association
  belongs_to :user
  belongs_to :prototype
end
