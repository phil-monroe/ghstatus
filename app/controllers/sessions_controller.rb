class SessionsController < ApplicationController

  skip_before_filter :require_user, only: [:github]

  def github
    user = User.from_github_omniauth(auth_hash)
    login(user)
    redirect_to root_path
  end

  def destroy
    logout
  end

  private
  def auth_hash
    request.env['omniauth.auth']
  end
end
