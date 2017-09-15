# == Schema Information
#
# Table name: prototype_images
#
#  id           :integer          not null, primary key
#  content      :string(255)      default(""), not null
#  status       :integer          not null
#  prototype_id :integer          not null
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

require 'rails_helper'
include ActionDispatch::TestProcess

describe PrototypeImage do
  let(:prototype_image)      { build(:prototype_image) }
  let(:prototype_main_image) { build(:prototype_image, :main) }
  let(:prototype_sub_image)  { build(:prototype_image, :sub) }

  describe 'validation' do
    context 'with all necessary attributes' do
      it 'main image is valid' do
        expect(prototype_main_image).to be_valid
      end

      it 'sub image is valid' do
        expect(prototype_sub_image).to be_valid
      end
    end

    context 'without all necessary attributes' do
      context 'is invalid without content attribute' do
        it 'main image is invalid' do
          prototype_main_image.content = nil
          prototype_main_image.valid?
          expect(prototype_main_image.errors[:content]).to include('can\'t be blank')
        end

        it 'sub image is invalid' do
          prototype_sub_image.content = nil
          prototype_sub_image.valid?
          expect(prototype_sub_image.errors[:content]).to include('can\'t be blank')
        end
      end

      it 'is invalid without status attribute' do
        prototype_image.valid?
        expect(prototype_image.errors[:status]).to include('can\'t be blank')
      end
    end

    it 'wrong format of image file' do
      expect{
        prototype_main_image.content = fixture_file_upload('spec/fixtures/baymax.tiff', 'image/tiff')
      }.to raise_error(CarrierWave::IntegrityError)
    end
  end

  describe 'association' do
    context 'is associated with prototype' do
      it 'if status is main' do
        prototype  = create(:prototype)
        prototype_main_image = create(:prototype_image, :main, prototype: prototype)
        expect(prototype_main_image.prototype).to eq prototype
      end

      it 'if status is sub' do
        prototype  = create(:prototype)
        prototype_sub_image = create(:prototype_image, :sub, prototype: prototype)
        expect(prototype_sub_image.prototype).to eq prototype
      end
    end
  end
end
