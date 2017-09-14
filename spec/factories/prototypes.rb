# == Schema Information
#
# Table name: prototypes
#
#  id          :integer          not null, primary key
#  name        :string(255)      default(""), not null
#  user_id     :integer
#  catchcopy   :text(65535)      not null
#  concept     :text(65535)      not null
#  likes_count :integer          default(0), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

FactoryGirl.define do
  factory :prototype, class: Prototype do
    name        { Faker::Pokemon.name }
    catchcopy   { Faker::StarWars.droid }
    concept     { Faker::MostInterestingManInTheWorld.quote }
    likes_count { Faker::Number.between(1, 300) }
    created_at  { Faker::Time.between(7.days.ago, Time.now) }
    association :user, factory: :user, name: Faker::Pokemon.name

    trait :with_main_image do
      ignore do
        default_main_image_num 1
      end

      after(:build) do |prototype, evaluator|
        prototype.prototype_images << build_list(:main_image, evaluator.default_main_image_num)
      end

      after(:create) do |prototype, evaluator|
        prototype.prototype_images << create_list(:main_image, evaluator.default_main_image_num)
      end
    end

    trait :with_sub_images do
      # 参考url
      # https://stackoverflow.com/questions/38573131/what-is-the-purpose-of-a-transient-do-block-in-factorygirl-factories
      # http://qiita.com/ogomr/items/935da1072301ddc1aeaf
      # Transient attributes allow you to pass in data that isn’t an attribute on the model.
      # Now transient attribute is replaced with ignore attribute
      ignore do
        default_sub_images_num 3
      end

      after(:build) do |prototype, evaluator|
        prototype.prototype_images << build_list(:sub_images, evaluator.default_sub_images_num)
      end

      after(:create) do |prototype, evaluator|
        prototype.prototype_images << create_list(:sub_images, evaluator.default_sub_images_num)
      end
    end

    trait :with_comments do
      ignore do
        default_comments_num 5
      end

      after(:build) do |prototype, evaluator|
        prototype.comments << build_list(:comment, evaluator.default_comments_num)
      end

      after(:create) do |prototype, evaluator|
        prototype.comments << create_list(:comment, evaluator.default_comments_num)
      end
    end

    trait :with_likes do
      ignore do
        default_likes_num 5
      end

      after(:build) do |prototype, evaluator|
        prototype.likes << build_list(:like, evaluator.default_likes_num)
      end

      after(:create) do |prototype, evaluator|
        prototype.likes << create_list(:like, evaluator.default_likes_num)
      end
    end
  end
end
