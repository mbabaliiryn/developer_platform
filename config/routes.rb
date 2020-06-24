# frozen_string_literal: true

Rails.application.routes.draw do
  get 'chats/create'
  get 'notice/create'
  get 'projects/new'
  get 'projects/index'
  get 'projects/create'

  devise_for :users, controllers: { registrations: 'users/registrations' }
  resources :users, only: [:show]
  resources :tasks, only: %i[index new create destroy]
  resources :groups, only: %i[index new create show destroy]
  resources :projects, only: %i[index new create show destroy]
  root 'users#profile'
  get 'externals_task', to: 'tasks#externals'
  get 'managing_developers', to: 'managers#developers'
  get 'future_tasks', to: 'tasks#future'
  get 'mark_task_done', to: 'tasks#done'
  post 'done_post', to: 'tasks#done_post'
  post 'managing_developers', to: 'notice#create'
  post 'notice_create', to: 'notice#create'
  post '/new_chat/:id', to: 'chats#create'

  resources :notice

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  mount ActionCable.server, at: '/cable'
end
