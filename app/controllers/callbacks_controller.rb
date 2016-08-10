class CallbacksController < Devise::OmniauthCallbacksController
  def github
    @user = User.from_omniauth(request.env['omniauth.auth'])
    sign_in @user
    cookies[:gist_explorer_token] = @user.token
    redirect_to Settings::App.app_url
  end
end
