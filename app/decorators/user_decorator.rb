class UserDecorator < ApplicationDecorator
  delegate_all

  decorates :user
  decorates_association :prototype
end
