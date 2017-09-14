# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  text         :text(65535)      not null
#  user_id      :integer
#  prototype_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryGirl.define do
  factory :comment do
    text { Faker::HarryPotter.quote }
    association :user,      factory: :user,      name: Faker::Pokemon.name
    association :prototype, factory: :prototype, name: Faker::HarryPotter.book
  end
end
