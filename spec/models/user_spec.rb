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

require 'rails_helper'

include ActionDispatch::TestProcess

describe User do
  let(:user) { build(:user) }

  describe '#create' do
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
  end

end
