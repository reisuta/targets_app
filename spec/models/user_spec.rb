require 'rails_helper'

RSpec.describe User, type: :model do
  include OmniAuthHelper

  describe 'omniauthのテスト' do
    context '新規のユーザーでログインするとき' do
      it 'レコードが1つ増えること' do
        expect { User.from_omniauth(google_omniauth) }.to change { User.count }.by(1)
      end

      it '意図したユーザーが作成されていること' do
        User.from_omniauth(google_omniauth)
        expect(User.last.name).to eq(OmniAuth.config.mock_auth[:google_oauth2][:info][:name])
      end
    end

    context '既に保存されているユーザーでログインするとき' do
      let!(:user) { User.from_omniauth(google_omniauth) }
      it '新しくユーザーが作成されないこと' do
        expect { User.from_omniauth(google_omniauth) }.not_to change { User.count }
      end
    end
  end
end
