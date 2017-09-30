# == Schema Information
#
# Table name: prototype_images
#
#  id           :integer          not null, primary key
#  content      :string(255)      default(""), not null
#  status       :integer          not null
#  prototype_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

DUMMY_REPEAT_NUMS = 20
RECORD_NAME = 'prototype_images'

def seed_image(file_name)
  File.open(File.join(Rails.root, "/spec/fixtures/#{file_name}"))
end

1.upto(DUMMY_REPEAT_NUMS) do |num|
  begin
    prototype_image = PrototypeImage.new(
      content:      seed_image('baymax.jpeg'),
      status:       Faker::Number.between(0, 1),
      prototype_id: Prototype.pluck(:id).sample
    )
    prototype_image.save!

     if num == DUMMY_REPEAT_NUMS
      p "#{DUMMY_REPEAT_NUMS} records of #{RECORD_NAME} inserted."
    end 
  rescue => error
    p "Seed file fails because #{error.message}."
    p " #{num - 1} records have been inserted. Total: #{PrototypeImage.count}"
    exit
  end

end
