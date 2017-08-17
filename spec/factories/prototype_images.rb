# == Schema Information
#
# Table name: prototype_images
#
#  id           :integer          not null, primary key
#  content      :string(255)
#  prototype_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#  status       :integer
#

include ActionDispatch::TestProcess

FactoryGirl.define do
  factory :prototype_image, class: PrototypeImage do
    content { fixture_file_upload("spec/fixtures/baymax.jpeg", 'image/jpeg') }
    association :prototype, factory: :prototype, name: Faker::HarryPotter.book

    trait :main do
      status :main
    end

    trait :sub do
      status :sub
    end

    # 参考url
    # http://qiita.com/ogomr/items/935da1072301ddc1aeaf
    factory :main_image, traits: [:main]
    factory :sub_images, traits: [:sub]
  end
end
