# == Schema Information
#
# Table name: prototypes
#
#  id          :integer          not null, primary key
#  name        :string(255)
#  catchcopy   :text(65535)
#  concept     :text(65535)
#  likes_count :integer          default(0)
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  user_id     :integer
#

require 'rails_helper'
include ActionDispatch::TestProcess

describe Prototype do
  describe 'associations' do
    let(:user) { create(:user) }
    let(:prototype)  { create(:prototype) }

    it 'is associated with a user' do
      prototype.user = user
      expect(prototype.user).to eq user
    end
  end
end
