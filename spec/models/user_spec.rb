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

require 'rails_helper'

include ActionDispatch::TestProcess

describe User do
  let(:user) { build(:user) }

  describe 'validation' do
    context 'when an user is filled with all valid attributes' do
      it 'is valid' do
        expect(user).to be_valid
      end
    end

    context 'when an user lacks of one of valid attributes' do
      it 'is invalid without a name' do
        user.name = nil
        user.valid?
        expect(user.errors[:name]).to include('can\'t be blank')
      end

      it 'is invalid without an email' do
        user.email = nil
        user.valid?
        expect(user.errors[:email]).to include('can\'t be blank')
      end

      it 'is invalid without a password' do
        user.password = nil
        user.valid?
        expect(user.errors[:password]).to include('can\'t be blank')
      end
    end

    context 'when an user tries to sign up with a duplicated email address' do
      it 'is invalid' do
        existing_user = create(:user)
        user.email = existing_user.email
        user.valid?
        expect(user.errors[:email]).to include('has already been taken')
      end
    end

    context 'when checking the length of the password' do
      it 'is valid if user\'s password length is within 6 to 128 characters' do
        password = Faker::Internet.password(6, 128, true, true)
        user.password = password
        user.valid?
        expect(user).to be_valid
      end

      it 'is invalid if an user has a password that has less than 5 characters' do
        password = Faker::Internet.password(1, 5, true, true)
        user.password = password
        user.valid?
        expect(user.errors[:password]).to include('is too short (minimum is 6 characters)')
      end

      it 'is invalid if an user has a password that has more than 129 characters' do
        password = Faker::Internet.password(129)
        user.password = password
        user.valid?
        expect(user.errors[:password]).to include("is too long (maximum is 128 characters)")
      end
    end
  end
end
