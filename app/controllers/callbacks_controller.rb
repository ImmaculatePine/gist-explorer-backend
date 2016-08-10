class CallbacksController < Devise::OmniauthCallbacksController
  skip_before_action :verify_authenticity_token

  def github
    @user = User.from_omniauth(request.env['omniauth.auth'])
    sign_in @user
    cookies[:gist_explorer_token] = {
      value: @user.token,
      domain: Settings::App.session_store_domain
    }
    redirect_to Settings::App.app_url
  end
end
