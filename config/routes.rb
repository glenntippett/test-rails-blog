Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  root 'articles#index'

  resources :articles do
    # https://guides.rubyonrails.org/routing.html#shallow-nesting
    resources :comments, shallow: true
    # https://guides.rubyonrails.org/routing.html#adding-member-routes
    member do
      post 'like', to: 'articles#like' # /article/:id/like
      delete 'unlike', to: 'articles#unlike' # article/:id/unlike
    end
  end
end
