Rails.application.routes.draw do
  get 'rgs', to: 'rgs#index'
  get 'rgs/:serial_code', to: 'rgs#index'
  post 'rgs', to: 'rgs#rgs'
  resources :cards do
    resources :license_groups do
      get 'download', to: 'license_groups#download'
      get 'download_front', to: 'license_groups#download_front'
      get 'download_back', to: 'license_groups#download_back'
    end
  end
  resources :downloads
  devise_for :users
  root to: "home#index"
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
