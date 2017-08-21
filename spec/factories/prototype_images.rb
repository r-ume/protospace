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

    # 参考url
    # http://qiita.com/ogomr/items/935da1072301ddc1aeaf

    # 忘れないようにメモ:
    # Trait
    # [2] pry(main)> FactoryGirl.attributes_for(:prototype_image)
    # => {:content=>#<Rack::Test::UploadedFile:0x007fcc7428a2b0
    #                 @content_type="image/jpeg", @original_filename="baymax.jpeg",
    #                 @tempfile=#<File:/var/folders/yy/42bpgmdj4t16rf0_5xsly3tc0000gp/T/baymax.jpeg20170818-39344-qq3gss>>}
    # [3] pry(main)> FactoryGirl.attributes_for(:prototype_image, :main)
    # => {:content=>#<Rack::Test::UploadedFile:0x007fcc702825c8
    #                 @content_type="image/jpeg", @original_filename="baymax.jpeg",
    #                 @tempfile=#<File:/var/folders/yy/42bpgmdj4t16rf0_5xsly3tc0000gp/T/baymax.jpeg20170818-39344-1os8psj>>,
    #                 :status=>:main}
    # [4] pry(main)> FactoryGirl.attributes_for(:prototype_image, :sub)
    # => {:content=>#<Rack::Test::UploadedFile:0x007fcc72f81510
    #                 @content_type="image/jpeg", @original_filename="baymax.jpeg",
    #                 @tempfile=#<File:/var/folders/yy/42bpgmdj4t16rf0_5xsly3tc0000gp/T/baymax.jpeg20170818-39344-10df806>>,
    #                 :status=>:sub}

    trait :main do
      status :main
    end

    trait :sub do
      status :sub
    end

    # traits で、traitをまとめることができる
    # [1] pry(main)> FactoryGirl.attributes_for(:main_image)
    #=> {:content=>#<Rack::Test::UploadedFile:0x007fcc76931a30
    #                 @content_type="image/jpeg", @original_filename="baymax.jpeg",
    #                 @tempfile=#<File:/var/folders/yy/42bpgmdj4t16rf0_5xsly3tc0000gp/T/baymax.jpeg20170818-39700-m9hx4r>>,
    #                 :status=>:main}
    # [2] pry(main)> FactoryGirl.attributes_for(:sub_images)
    #=> {:content=>#<Rack::Test::UploadedFile:0x007fcc75551128
    #                 @content_type="image/jpeg", @original_filename="baymax.jpeg",
    #                 @tempfile=#<File:/var/folders/yy/42bpgmdj4t16rf0_5xsly3tc0000gp/T/baymax.jpeg20170818-39700-106sw78>>,
    #                 :status=>:sub}
    factory :main_image, traits: [:main]
    factory :sub_images, traits: [:sub]
  end
end
