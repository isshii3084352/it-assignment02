Rails.application.routes.draw do

  root 'projects#index'

  resources :projects do
    resources :tasks, only: [:create, :destroy]
  end

  post '/projects/:project_id/tasks/:id/toggle' => 'tasks#toggle'
end