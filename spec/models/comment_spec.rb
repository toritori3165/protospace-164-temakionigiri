require 'rails_helper'

RSpec.describe Comment, type: :model do
  before do
    @comment = FactoryBot.build(:comment)
  end

  describe 'コメントの保存' do
    context 'コメントが投稿できない場合' do
      it 'コンテントが空では投稿できない' do
        @comment.content = ''
        @comment.valid?
        expect(@comment.errors[:content]).to include("can't be blank")
      end
      it 'プロトタイプが紐付いていなければ投稿できない' do
        @comment.prototype = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('Prototype must exist')
      end
      it 'ユーザーが紐付いていなければ投稿できない' do
        @comment.user = nil
        @comment.valid?
        expect(@comment.errors.full_messages).to include('User must exist')
      end
    end

    context 'コメントが投稿できる場合' do
      it 'コンテントを入れて投稿できる' do
        expect(@comment).to be_valid
      end
    end
  end
end