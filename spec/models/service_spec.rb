require 'rails_helper'

RSpec.describe Service, type: :model do
  describe 'validation' do
    context '正常系' do
      it 'nameの値が存在するとき、作成できる' do
        service = build(:service)
        service.valid?
        expect(service).to be_valid
      end

      it 'nameの値が30文字以内のとき、作成できる' do
        service = build(:service, name: ('a'*30))
        service.valid?
        expect(service).to be_valid
      end
    end

    context '異常系' do
      it 'nameの値が空のとき、作成できない' do
        service = build(:service, name: '')
        service.valid?
        expect(service).not_to be_valid
      end

      it 'nameの値が31文字以上のとき、作成できない' do
        service = build(:service, name: ('a'*31))
        service.valid?
        expect(service).not_to be_valid
      end
    end
  end
end
