Rails.application.routes.draw do

  resources :projects

#projectsのindexアクションをrootにする。
  root 'projects#index'
end

# resources :projects 記述後、端末で $ rails routes の実行結果：
#
#       Prefix Verb   URI Pattern                  Controller#Action
#     projects GET    /projects(.:format)          projects#index
#             POST   /projects(.:format)          projects#create
# new_project GET    /projects/new(.:format)      projects#new
# edit_project GET    /projects/:id/edit(.:format) projects#edit
#     project GET    /projects/:id(.:format)      projects#show
#             PATCH  /projects/:id(.:format)      projects#update
#             PUT    /projects/:id(.:format)      projects#update
#             DELETE /projects/:id(.:format)      projects#destroy

# Prefix            : ***
# Verb              : ***
# URI Pattern       : ***
# Controller#Action : ***