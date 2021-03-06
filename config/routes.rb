Rails.application.routes.draw do

  # 7つのアクション一気作成の裏技。new,show,index,create,edit,update,destroy
  resources :users
# 7つのアクションしてるけども・・・
  get '/login',to: 'sessions#new'
  post '/login',to: 'sessions#create'
  delete '/logout',to: 'sessions#destroy'
  # 7つのアクションしてるけども・・・
  get '/signup',to: 'users#new'

  root 'static_pages#home'
  get '/about',to: 'static_pages#about'
  get '/contact',to: 'static_pages#contact'

  resources :projects
  get '/project/:id',to: 'projects#new'
  post 'projects/:id' => 'projects#create'
end
