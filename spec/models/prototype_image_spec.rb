require 'rails_helper'

describe PrototypeImage do
  describe 'validation' do
    let(:prototype_image)      { build(:prototype_image) }
    let(:prototype_main_image) { build(:prototype_image, :main) }
    let(:prototype_sub_image)  { build(:prototype_image, :sub) }

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
  end
end
