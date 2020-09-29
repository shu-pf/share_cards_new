Rails.application.routes.draw do
  get 'rgs', to: 'rgs#index'
  get 'rgs/:serial_code', to: 'rgs#index'
  post 'rgs', to: 'rgs#rgs'
  
  get 'cards/select', to: 'cards#select'
  get 'cards/new_music', to: 'cards#new_music'
  resources :cards do
    get 'edit_title', to: 'cards#edit_title'
    get 'edit_auther_name', to: 'cards#edit_auther_name'
    get 'edit_content', to: 'cards#edit_content'
    get 'edit_card_img', to: 'cards#edit_card_img'
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
