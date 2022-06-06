module OmniAuthHelper
  def google_omniauth
    OmniAuth.config.test_mode = true

    OmniAuth.config.mock_auth[:google_oauth2] = OmniAuth::AuthHash.new({
      provider: 'google_oauth2',
      uid:      '1234',
      info:     { name: 'テストユーザー', email: 'ommniauth.test@gmail.com' }
    })
  end
end
