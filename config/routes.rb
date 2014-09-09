Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations' }
  devise_scope :user do
    get 'account' => 'devise/registrations#edit'
    get 'sign-in' => 'devise/sessions#new'
    get 'sign-up' => 'devise/registrations#new'
    get 'sign-out' => 'devise/sessions#destroy'
  end
  devise_scope :user do
    get 'sign-in' => 'devise/sessions#new'
    get 'sign-up' => 'devise/registrations#new'
    get 'sign-out' => 'devise/sessions#destroy'
  end
  resources :challenges
  resources :challenge_partners
  resources :users
  root 'challenges#index'
end
