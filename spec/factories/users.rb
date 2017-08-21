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
#  profile                :text(65535)
#  position               :string(255)      default(""), not null
#  occupation             :text(65535)
#  avatar                 :string(255)      default(""), not null
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

FactoryGirl.define do
  factory :user do
    name       { Faker::HarryPotter.character } # just for fun
    profile    { Faker::HarryPotter.book }
    position   { Faker::Job.field }
    occupation { Faker::Job.title }
    avatar     { fixture_file_upload(Rails.root.join('spec/fixtures/baymax.jpeg')) }
    email      { Faker::Internet.email }
    password   { Faker::Internet.password(6, 128, true, true) }
  end
end
