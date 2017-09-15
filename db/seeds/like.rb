# == Schema Information
#
# Table name: likes
#
#  id           :integer          not null, primary key
#  user_id      :integer          not null
#  prototype_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

DUMMY_REPEAT_NUMS = 20
RECORD_NAME = 'likes'

1.upto(DUMMY_REPEAT_NUMS) do |num|
  begin
    like = Like.new(
      user_id: User.pluck(:id).sample,
      prototype_id: Prototype.pluck(:id).sample
    )
    like.save!

     if num == DUMMY_REPEAT_NUMS
      p "#{DUMMY_REPEAT_NUMS} records of #{RECORD_NAME} inserted."
    end 
  rescue => error
    p "Seed file fails because #{error.message}."
    p " #{num - 1} records have been inserted. Total: #{Like.count}"
    exit
  end

end
