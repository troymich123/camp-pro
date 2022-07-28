require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe 'ギア投稿機能' do
    context 'ギアが投稿できるとき' do
      it 'category_id, brand_id, gearmodel, text, user_idが存在すれば登録できる' do
        expect(@post).to be_valid
      end
      it 'imageが存在しなくても登録できる' do
        @post.image = nil
        @post.valid?
        expect(@post).to be_valid
      end
    end

    context 'ギアが投稿できないとき' do
      it 'category_idが空では出品できない' do
        @post.category_id = 1
        @post.valid?
        expect(@post.errors.full_messages).to include('Categoryを入力してください')
      end
      it 'brand_idが空では出品できない' do
        @post.brand_id = 1
        @post.valid?
        expect(@post.errors.full_messages).to include('Brandを入力してください')
      end
      it 'gearmodelが空では出品できない' do
        @post.gearmodel = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('Gearmodelを入力してください')
      end
      it 'textが空では出品できない' do
        @post.text = ''
        @post.valid?
        expect(@post.errors.full_messages).to include('Textを入力してください')
      end
      it 'userが紐付いていない場合は登録できない' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('Userを入力してください')
      end
    end
  end
end
