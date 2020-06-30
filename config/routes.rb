# frozen_string_literal: true

Rails.application.routes.draw do
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

end
