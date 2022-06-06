Rails.application.routes.draw do
  devise_for :users, skip: :session, controllers: { omniauth_callbacks: 'users/omniauth_callbacks' }
  devise_scope :user do
    get 'login', to: 'users/sessions#new'
    post 'login', to: 'users/sessions#create'
    delete 'logout', to: 'users/sessions#destroy'
  end

  # 暫定 root "works#index"に変える
  root 'services#index'
  resources 'services'
  resources 'activities'
  # resources 'works'
  resources 'technologies'
  # resources 'services'
  # resources 'categories'
  # resources 'leaders'

  # namespace 'api' do
  #   resources 'works'
  #   resources 'technologies'
  #   resources 'services'
  #   resources 'categories'
  #   resources 'leaders'
  # end
end
