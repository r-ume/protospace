# == Schema Information
#
# Table name: users
#
#  id                     :integer          not null, primary key
#  email                  :string(255)      default(""), not null
#  encrypted_password     :string(255)      default(""), not null
#  reset_password_token   :string(255)
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  sign_in_count          :integer          default(0), not null
#  current_sign_in_at     :datetime
#  last_sign_in_at        :datetime
#  current_sign_in_ip     :string(255)
#  last_sign_in_ip        :string(255)
#  name                   :string(255)      default(""), not null
#  profile                :text(65535)      not null
#  position               :string(255)      default(""), not null
#  occupation             :text(65535)      not null
#  avatar                 :string(255)      default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

DUMMY_REPEAT_NUMS = 20
RECORD_NAME = 'user'

1.upto(DUMMY_REPEAT_NUMS) do |num|

  begin
    character_name = Faker::HowIMetYourMother.name
    user = User.new(
      name:       character_name,
      profile:    Faker::Superhero.power,
      position:   Faker::HowIMetYourMother.high_five,
      occupation: Faker::Job.title,
      email:      Faker::Internet.email(character_name),
      password:   Faker::Internet.password(10, 20),
      avatar:     Faker::Avatar.image
    ) 
    user.save!
    if num == DUMMY_REPEAT_NUMS
      p "#{DUMMY_REPEAT_NUMS} records of #{RECORD_NAME} inserted."
    end 
  rescue => error
    p "Seed file fails because #{error.message}."
    p " #{num - 1} records have been inserted. Total: #{Prototype.count}"
    exit
  end
end
