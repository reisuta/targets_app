require 'rails_helper'

RSpec.describe Technology, type: :model do
  describe 'validation' do
    context '正常系' do
      it 'nameの値が存在するとき、作成できる' do
        technology = build(:technology)
        technology.valid?
        expect(technology).to be_valid
      end

      it 'nameの値が30文字以内のとき、作成できる' do
        technology = build(:technology, name: ('a'*30))
        technology.valid?
        expect(technology).to be_valid
      end
    end

    context '異常系' do
      it 'nameの値が空のとき、作成できない' do
        technology = build(:technology, name: '')
        technology.valid?
        expect(technology).not_to be_valid
      end

      it 'nameの値が31文字以上のとき、作成できない' do
        technology = build(:technology, name: ('a'*31))
        technology.valid?
        expect(technology).not_to be_valid
      end
    end
  end
end
