Rails.application.routes.draw do
  root 'site#index'
  devise_for :users
  resources :secret_codes, only:[:index, :destroy] do
    collection do
      post :generate
    end
  end

end
