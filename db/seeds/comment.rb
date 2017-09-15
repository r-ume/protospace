# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  text         :text(65535)      not null
#  user_id      :integer          not null
#  prototype_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

DUMMY_REPEAT_NUMS = 20
RECORD_NAME = 'comments'

1.upto(DUMMY_REPEAT_NUMS) do |num|

  begin 
    comment = Comment.new(
      text: Faker::HowIMetYourMother.quote,
      user_id: User.pluck(:id).sample,
      prototype_id: Prototype.pluck(:id).sample

    )
    comment.save!
    if num == DUMMY_REPEAT_NUMS
      p "#{DUMMY_REPEAT_NUMS} records of #{RECORD_NAME} inserted."
    end 
  rescue => error
    p "Seed file fails because #{error.message}."
    p " #{num - 1} records have been inserted. Total: #{Comment.count}"
    exit
  end
end
