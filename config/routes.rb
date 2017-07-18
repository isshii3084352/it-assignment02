Rails.application.routes.draw do

  root 'projects#index'

  resources :projects do
    resources :tasks, only: [:create, :destroy]
  end

  post '/projects/:project_id/tasks/:id/toggle' => 'tasks#toggle'
end


#端末で $ rails routes の実行結果：
#       Prefix Verb   URI Pattern                                      Controller#Action
# project_tasks POST   /projects/:project_id/tasks(.:format)            tasks#create
# project_task DELETE /projects/:project_id/tasks/:id(.:format)        tasks#destroy
#     projects GET    /projects(.:format)                              projects#index
#               POST   /projects(.:format)                              projects#create
#   new_project GET    /projects/new(.:format)                          projects#new
# edit_project GET    /projects/:id/edit(.:format)                     projects#edit
#       project GET    /projects/:id(.:format)                          projects#show
#               PATCH  /projects/:id(.:format)                          projects#update
#               PUT    /projects/:id(.:format)                          projects#update
#               DELETE /projects/:id(.:format)                          projects#destroy
#         root GET    /                                                projects#index
#               POST   /projects/:project_id/tasks/:id/toggle(.:format) tasks#toggle

# Prefix            : ***
# Verb              : ***
# URI Pattern       : ***
# Controller#Action : ***