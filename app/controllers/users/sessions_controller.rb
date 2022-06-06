class Users::SessionsController < Devise::SessionsController
  skip_before_action :authenticate!, only: [:new, :create]

  def new # deviseのcontrollerのnewアクションに飛ばすと無限リダイレクトになるので追加
    super
  end

  def create
    super
    flash[:success] = t('devise.sessions.signed_in')
    flash[:notice] = nil
  end

  def destroy # ログアウトに成功したらデフォルトではrootに飛んでいたので、login_urlに飛ばせるようにdeviseから継承して上書き
    super
    flash[:success] = t('devise.sessions.signed_out')
    flash[:notice] = nil
  end

  private
    # ログアウトに成功したらデフォルトではrootに飛んでいたので、login_urlに飛ばせるようにdeviseから継承してオーバーライド
    def respond_to_on_destroy
      respond_to do |format|
        format.all { head :no_content }
        # status see_otherを追加
        format.any(*navigational_formats) { redirect_to login_url, status: :see_other }
      end
    end
end
