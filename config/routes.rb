Rails.application.routes.draw do
  resources :cards do
    resources :license_groups do
      get 'download', to: 'license_groups#download'
      get 'download2', to: 'license_groups#download2'
    end
  end
  get 'downloads/', to: 'downloads#index'
  devise_for :users
  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
