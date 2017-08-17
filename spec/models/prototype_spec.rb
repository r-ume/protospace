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

    context 'with a user' do
      it 'is associated with an user' do
        prototype.user = user
        expect(prototype.user).to eq user
      end
    end

    context 'with comments' do
      let(:additional_comments_num) { 5 }
      let!(:prototype) { create(:prototype, :with_comments, default_comments_num: additional_comments_num) }
      it 'deletes the comments when a prototype gets deleted' do
        expect{ prototype.destroy }.to change{ Comment.count }.by(-1 * (additional_comments_num * 2))
      end
    end
  end
end
