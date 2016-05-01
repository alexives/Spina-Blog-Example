Spina::Engine.routes.draw do
  namespace :blog, path: 'blog' do
    resource :sitemap, only: [:show], format: :xml
  end

  resources :blogposts, path: 'blog', only: [:show, :index]

  namespace :admin, path: Spina.config.backend_path do
    resources :blogposts, except: [:show]
  end
end
