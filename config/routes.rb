Rails.application.routes.draw do
  # root 'products#index'
  root 'welcome#index'

  devise_for :users
  namespace :admin do
    resources :products
    resources :orders
  end

  resources :products do
    resources :comments
    member do
      post :add_to_cart
      put "like", to: "products#upvote"
    end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
resources :carts do
    collection do
      delete :clean
       post :checkout
    end
  end

resources :cart_items
  resources :orders do
    member do
      post :pay_with_alipay
      post :pay_with_wechat
    end
  end

namespace :account do
  resources :orders, :favorites, only: [:index]
end
resources :favorites, only: [:create, :destroy]
end
