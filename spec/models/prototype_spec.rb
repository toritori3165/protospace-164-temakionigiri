require 'rails_helper'

RSpec.describe Prototype, type: :model do
  before do
    @prototype = FactoryBot.build(:prototype)
  end

  describe '投稿登録' do
    context '新規投稿ができない時' do
      it '画像が必須であること' do
        @prototype.image = nil
        @prototype.valid?
        expect(@prototype.errors[:image]).to include("can't be blank")
      end

      it 'プロトタイプの名称が必須であること' do
        @prototype.title = ''
        @prototype.valid?
        expect(@prototype.errors[:title]).to include("can't be blank")
      end

      it 'キャッチコピーが必須であること' do
        @prototype.catch_copy = ''
        @prototype.valid?
        expect(@prototype.errors[:catch_copy]).to include("can't be blank")
      end

      it 'コンセプトが必須であること' do
        @prototype.concept = ''
        @prototype.valid?
        expect(@prototype.errors[:concept]).to include("can't be blank")
      end
    end

    context '新規登録ができる時' do
      it '適切なデータが存在すれば投稿できる' do
        expect(@prototype).to be_valid
      end
    end
  end
end
