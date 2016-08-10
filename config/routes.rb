Rails.application.routes.draw do
  devise_for :users, controllers: { omniauth_callbacks: 'callbacks' }

  namespace :api, path: '' do
    resources :labels, only: [:index, :create, :destroy] do
      post 'gists' => 'gists#toggle'
    end
  end
end
