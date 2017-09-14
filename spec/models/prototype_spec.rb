# == Schema Information
#
# Table name: prototypes
#
#  id          :integer          not null, primary key
#  name        :string(255)      default(""), not null
#  user_id     :integer          not null
#  catchcopy   :text(65535)      not null
#  concept     :text(65535)      not null
#  likes_count :integer          default(0), not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
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

    context 'with prototype main image' do
      let(:additional_main_prototype_image_num) { 1 }
      let!(:prototype) { create(:prototype, :with_main_image, default_main_image_num: additional_main_prototype_image_num) }

      it 'deletes the prototype main image when a prototype gets deleted' do
        # total_main_image_num = default_main_image_num + additional_main_prototype_image_num = 3 + 3
        total_main_image_num = additional_main_prototype_image_num * 2
        expect{ prototype.destroy }.to change{ PrototypeImage.count }.by(-1 * total_main_image_num)
      end
    end

    context 'with prototype sub images' do
      let(:additional_sub_prototype_images_num) { 3 }
      let!(:prototype) { create(:prototype, :with_sub_images, default_sub_images_num: additional_sub_prototype_images_num) }

      it 'deletes the prototype sub images when a prototype gets deleted' do
        # total_sub_images_num = addtional_sub_prototype_images + default_sub_images_num = 3 + 3
        total_sub_images_num = additional_sub_prototype_images_num * 2
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
      let!(:prototype) { create(:prototype, :with_likes, default_likes_num: additional_likes_num) }
      it 'deletes the likes when a prototype gets deleted' do
        # total_likes_num = addtional_comments_num + default_comments_num = 5 + 5
        total_likes_num = additional_likes_num * 2
        expect{ prototype.destroy }.to change{ Like.count }.by(-1 * total_likes_num)
      end
    end
  end

  describe 'validations' do
    let(:prototype) { build(:prototype) }

    context 'with all necessary attributes' do
      it 'is valid' do
        expect(prototype).to be_valid
      end
    end

    context 'without all necessary attributes' do
      it 'is invalid without a name' do
        prototype.name = nil
        prototype.valid?
        expect(prototype.errors[:name]).to include('can\'t be blank')
      end

      it 'is invalid without a catchcopy' do
        prototype.catchcopy = nil
        prototype.valid?
        expect(prototype.errors[:catchcopy]).to include('can\'t be blank')
      end

      it 'is invalid without a concept' do
        prototype.concept = nil
        prototype.valid?
        expect(prototype.errors[:concept]).to include('can\'t be blank')
      end
    end
  end

  describe 'images_with_no_contents method' do
    context 'does not allow any image to be saved without any content' do
      it 'if main' do
        prototype_main_image = build(:prototype_image, :main, content: nil)
        prototype_main_image.valid?
        expect(prototype_main_image.errors[:content]).to include('can\'t be blank')
      end

      it 'if sub' do
        prototype_main_image = build(:prototype_image, :sub, content: nil)
        prototype_main_image.valid?
        expect(prototype_main_image.errors[:content]).to include('can\'t be blank')
      end
    end
  end
end
