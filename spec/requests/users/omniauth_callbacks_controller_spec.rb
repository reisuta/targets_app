require 'rails_helper'

RSpec.describe Users::OmniauthCallbacksController, type: :request do
  include OmniAuthHelper
  describe 'google authentication' do
    subject { post user_google_oauth2_omniauth_callback_path }
    before do
      Rails.application.env_config['devise.mapping'] = nil # 各テスト実行時にリセット
      OmniAuth.config.mock_auth[:google_oauth2] = nil
      Rails.application.env_config['devise.mapping'] = Devise.mappings[:user]
      Rails.application.env_config['omniauth.auth'] = google_omniauth
    end

    it '302が返ってくること' do
      subject
      expect(response).to have_http_status(302)
    end

    it 'rootにリダイレクトされること' do
      subject
      expect(response).to redirect_to root_url
    end
  end
end
