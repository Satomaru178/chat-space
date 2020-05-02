require 'rails_helper'

describe Message do
  describe '#create' do
    context 'messageを保存できる場合' do
      it 'contentがあれば保存できること' do
        expect(build(:message, image: nil)).to be_valid
      end

      it '画像があれば保存できること' do
        expect(build(:message, content: nil)).to be_valid
      end

      it 'メッセージと画像があれば保存できること' do
        expect(build(:message)).to be_valid
      end
    end

    context 'messageを保存できない場合' do
      it 'contentとimageが両方体と保存できないこと' do
        message = build(:message, content: nil, image: nil)
        message.valid?
        expect(message.errors[:content]).to include("を入力してください")
      end

      it 'group_idが無いと保存できないこと' do
        message = build(:message, group_id: nil)
        message.valid?
        expect(message.errors[:group]).to include("を入力してください")
      end

      it 'user_idが無いと保存でいないこと' do
        message = build(:message, user_id: nil)
        message.valid?
        expect(message.errors[:user]).to include("を入力してください")
      end
    end
  end
end