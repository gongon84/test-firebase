class OauthsController < ApplicationController
  def oauth
    login_at(auth_params[:provider])
  end

  def callback
    provider = auth_params[:provider]
    # 2回目以降のログイン
    if (@user = login_from(provider))
      redirect_to root_path, notice: 'googleでログインしました'
    else
      # 初めてログインする場合
      begin
        @user = create_from(provider)
        reset_session
        auto_login(@user) # そのままログインする
        redirect_to root_path, notice: 'googleでのログインに成功しました'
      rescue StandardError
        redirect_to root_path, notice: 'ログインに失敗しました'
      end
    end
  end

  private

  def auth_params
    params.permit(:code, :provider)
  end
end
