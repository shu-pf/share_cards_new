Rails.application.routes.draw do
  get 'rgs', to: 'rgs#index'
  get 'rgs/:serial_code', to: 'rgs#index'
  post 'rgs', to: 'rgs#rgs'
  
  resources :cards do
    get 'edit_title', to: 'cards#edit_title'
    get 'edit_auther_name', to: 'cards#edit_auther_name'
    get 'edit_content', to: 'cards#edit_content'
    get 'edit_card_img', to: 'cards#edit_card_img'
    resources :contents
    resources :license_groups do
      get 'download', to: 'license_groups#download'
      get 'download_front', to: 'license_groups#download_front'
      get 'download_back', to: 'license_groups#download_back'
    end
  end
  resources :downloads do
    resources :download_contents
  end
  devise_for :users
  root to: "home#index"
  get 'topic', to: 'home#topic'
  get 'use', to: 'home#use'
  get 'question', to: 'home#question'
  get 'contact', to: 'home#contact'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
