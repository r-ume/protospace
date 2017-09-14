# == Schema Information
#
# Table name: comments
#
#  id           :integer          not null, primary key
#  text         :text(65535)      not null
#  user_id      :integer
#  prototype_id :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'

describe Comment do
  context 'validation' do
    it 'is associated with prototype' do
      prototype = create(:prototype)
      comment = create(:comment, prototype: prototype)
      expect(comment.prototype).to eq prototype
    end

    it 'is associated with user' do
      user = create(:user)
      comment = create(:comment, user: user)
      expect(comment.user).to eq user
    end
  end
end
