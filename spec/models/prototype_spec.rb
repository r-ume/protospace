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
    context 'with a user' do
      let(:user) { create(:user) }
      let(:prototype)  { create(:prototype) }
      it 'is associated with an user' do
        prototype.user = user
        expect(prototype.user).to eq user
      end
    end

    context 'with prototype images' do
      let(:additional_sub_prototype_images) { 3 }
      let!(:prototype) { create(:prototype, :with_sub_images, default_sub_images_num: additional_sub_prototype_images) }

      it 'deletes the prototype sub images when a prototype gets deleted' do
        # total_sub_images_num = addtional_sub_prototype_images + default_sub_images_num = 3 + 3
        total_sub_images_num = additional_sub_prototype_images * 2
        expect{ prototype.destroy }.to change{ PrototypeImage.count }.by(-1 * total_sub_images_num)
      end
    end

    context 'with comments' do
      let(:additional_comments_num) { 5 }
      let!(:prototype) { create(:prototype, :with_comments, default_comments_num: additional_comments_num) }
      it 'deletes the comments when a prototype gets deleted' do
        # total_comments_num = addtional_comments_num + default_comments_num = 5 + 5
        total_comments_num = additional_comments_num * 2
        expect{ prototype.destroy }.to change{ Comment.count }.by(-1 * total_comments_num)
      end
    end

    context 'with likes' do
      let(:additional_likes_num) { 5 }
      let!(:prototype) { create(:prototype, :with_comments, default_comments_num: additional_likes_num) }
      it 'deletes the likes when a prototype gets deleted' do
        # total_likes_num = addtional_comments_num + default_comments_num = 5 + 5
        total_likes_num = additional_likes_num * 2
        expect{ prototype.destroy }.to change{ Comment.count }.by(-1 * total_likes_num)
      end
    end
  end
end
