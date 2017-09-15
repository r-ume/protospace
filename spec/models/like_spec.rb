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

require 'rails_helper'

describe Like do
  context 'validation' do
    it 'is associated with prototype' do
      prototype = create(:prototype)
      like = create(:like, prototype: prototype)
      expect(like.prototype).to eq prototype
    end

    it 'is associated with user' do
      user = create(:user)
      like = create(:like, user: user)
      expect(like.user).to eq user
    end
  end
end
