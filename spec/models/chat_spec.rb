require 'rails_helper'
describe Chat do
  describe '#create' do
    it "is valid with a body" do
      chat = build(:chat)
      expect(chat).to be_valid
    end

    it "is invalid without a body" do
      chat = build(:chat, body: nil)
      chat.valid?
      expect(chat.errors[:body]).to include('が入力されていません')
    end
  end
end
