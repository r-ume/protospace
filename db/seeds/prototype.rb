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

DUMMY_REPEAT_NUMS = 20
RECORD_NAME = 'prototypes'

1.upto(DUMMY_REPEAT_NUMS) do |num|

  begin 
    prototype = Prototype.new(
      name:        Faker::HowIMetYourMother.character,
      user_id:     User.pluck(:id).sample,
      catchcopy:   Faker::HowIMetYourMother.catch_phrase,
      concept:     Faker::HowIMetYourMother.quote,
      likes_count: Faker::Number.number(3)
    )

    prototype.save!
    if num == DUMMY_REPEAT_NUMS
      p "#{DUMMY_REPEAT_NUMS} records of #{RECORD_NAME} inserted."
    end 
  rescue => error
    p "Seed file fails because #{error.message}."
    p " #{num - 1} records have been inserted. Total: #{Prototype.count}"
    exit
  end
end
