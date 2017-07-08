class UserDecorator < ApplicationDecorator
  delegate_all
  decorates_association :prototype
end
