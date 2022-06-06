require 'rails_helper'

RSpec.describe Activity, type: :model do
  describe 'validation' do
    context 'validation 作成できない場合' do
      it 'タイトルが空のとき、作成できない' do
        activity = build(:activity, title: '')
        expect(activity).not_to be_valid
      end

      it 'PM名が空のとき、作成できない' do
        activity = build(:activity, leader_name: '')
        expect(activity).not_to be_valid
      end

      it '金額が空のとき、作成できない' do
        activity = build(:activity, amount: '')
        expect(activity).not_to be_valid
      end

      it '金額がマイナスのとき、作成できない' do
        activity = build(:activity, amount: -1)
        expect(activity).not_to be_valid
      end

      it '金額が整数でないとき、作成できない' do
        activity = build(:activity, amount: 1.5)
        expect(activity).not_to be_valid
      end

      it '提案骨子が空のとき、作成できない' do
        activity = build(:activity, suggestion_summary: '')
        expect(activity).not_to be_valid
      end

      it '提案詳細が空のとき、作成できない' do
        activity = build(:activity, suggestion_detail: '')
        expect(activity).not_to be_valid
      end

      it '終了日時が開始日時よりも前の日付のとき、作成できない' do
        activity = build(:activity, started_at: '2022-05-10 00:00:00', ended_at: '2022-05-01 00:00:00')
        expect(activity).not_to be_valid
      end
    end
  end
end
