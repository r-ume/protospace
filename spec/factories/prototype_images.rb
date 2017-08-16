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

FactoryGirl.define do
  factory :prototype_image do
    content { fixture_file_upload(Rails.root.join('spec/fixtures/baymax.jpeg')) }
    association :prototype, factory: :prototype, name: Faker::HarryPotter.book

    # 参考url https://techracho.bpsinc.jp/morimorihoge/2013_08_23/12744
    trait :main_image do
      status 0
    end

    trait :sub_images do
      status 1
    end
  end
end
