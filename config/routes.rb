GHStatus::Application.routes.draw do
  get '/auth/github',          as: 'auth_github'
  get '/auth/github/callback', to: 'sessions#github'
  get '/logout',               to: 'sessions#destroy'

  get '/dashboard',          to: 'repos#index'
  get '/:user/:repo',        to: 'repos#show'
  get '/:user/:repo/status', to: 'repos#status'

  root to: 'main#index'
end
