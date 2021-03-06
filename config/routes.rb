Rails.application.routes.draw do
  require 'sidekiq/web'
  mount Sidekiq::Web, at: "/sidekiq"

  get 'admin/', to: 'admin#index'
  get 'admin/new_mail', to: 'admin#new_mail'
  post 'admin/send_mail', to: 'admin#send_mail'

  get 'rgs', to: 'rgs#index'
  get 'rgs/:serial_code', to: 'rgs#index'
  post 'rgs', to: 'rgs#rgs'
  
  resources :cards do
    get 'edit_title', to: 'cards#edit_title'
    get 'edit_auther_name', to: 'cards#edit_auther_name'
    get 'edit_content', to: 'cards#edit_content'
    get 'edit_card_img', to: 'cards#edit_card_img'
    resources :contents
    resources :musics do
      post 'moveup', to: 'musics#moveup'
      post 'movedown', to: 'musics#movedown'
      post 'music_destroy', to: 'musics#music_destroy'
    end
    resources :license_groups do
      get 'download', to: 'license_groups#download'
      get 'download_front', to: 'license_groups#download_front'
      get 'download_back', to: 'license_groups#download_back'
    end
  end
  resources :downloads do
    resources :download_musics
    get 'mp3_zip', to: 'download_musics#mp3_zip'
    get 'flac_zip', to: 'download_musics#flac_zip'
    resources :download_contents
  end
  devise_for :users
  root to: "home#index"
  get 'topic', to: 'home#topic'
  get 'use_card', to: 'home#use_card'
  get 'use_label', to: 'home#use_label'
  get 'use_make_card', to: 'home#use_make_card'
  get 'question', to: 'home#question'
  get 'contact', to: 'home#contact'
  post :contact, to: 'home#contact_confirm'
  post 'contact_create', to: 'home#contact_create'
  get 'contact_complete', to: 'home#contact_complete'
  get 'terms_of_service', to: 'home#terms_of_service'
  get 'privacy_policy', to: 'home#privacy_policy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
