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

FactoryGirl.define do
  factory :prototype do
    name        { Faker::Pokemon.name }
    catchcopy   { Faker::StarWars.droid }
    concept     { Faker::MostInterestingManInTheWorld.quote }
    likes_count { Faker::Number.between(1, 300) }
    created_at
    association :user, factory: :user, name: Faker::Pokemon.name
  end
end
