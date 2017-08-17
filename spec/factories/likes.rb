# == Schema Information
#
# Table name: likes
#
#  id           :integer          not null, primary key
#  user_id      :integer
#  prototype_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

FactoryGirl.define do
  factory :like do
    association :user,      factory: :user,      name: Faker::Pokemon.name
    association :prototype, factory: :prototype, name: Faker::HarryPotter.book
  end
end
