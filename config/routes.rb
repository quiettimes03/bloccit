Rails.application.routes.draw do
  get 'sponsored_posts/show'

  get 'sponsored_posts/new'

  get 'sponsored_posts/edit'

  resources :topics do
    resources :posts, except: [:index]
    resources :sponsoredposts
  end

  get 'about' => 'welcome#about'

  root 'welcome#index'
end
