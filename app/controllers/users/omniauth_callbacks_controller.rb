class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :authenticate!

  def google_oauth2
    @user = User.from_omniauth(request.env['omniauth.auth'])
    flash[:success] = t('devise.omniauth_callbacks.success')
    sign_in_and_redirect @user, event: :authentication
  end

  def failure
    flash[:danger] = t('devise.omniauth_callbacks.failure')
    redirect_to login_url
  end
end
