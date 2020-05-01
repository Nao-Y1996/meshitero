Rails.application.routes.draw do
  #get 'users/show'
  devise_for :users
  root 'post_images#index'
  resources :post_images, only: [:new, :create, :index, :show]

  resources :post_images, only: [:new, :create, :index, :show] do
    resource :favorites, only: [:create, :destroy]
    resource :post_comments, only: [:create]
  end
  
  resources :post_images, only: [:new, :create, :index, :show, :destroy] do
    resource :favorites, only: [:create, :destroy]
    resource :post_comments, only: [:create, :destroy]
  end
  resources :users, only: [:show,:edit,:update]
  #resources :users, only: [:show, :edit, :update]
end  
=begin
                   Prefix Verb   URI Pattern                                                                              Controller#Action
         new_user_session GET    /users/sign_in                                                                 devise/sessions#new
             user_session POST   /users/sign_in                                                                 devise/sessions#create
     destroy_user_session DELETE /users/sign_out                                                                devise/sessions#destroy
        new_user_password GET    /users/password/new                                                            devise/passwords#new
       edit_user_password GET    /users/password/edit                                                           devise/passwords#edit
            user_password PATCH  /users/password                                                                devise/passwords#update
                          PUT    /users/password                                                                devise/passwords#update
                          POST   /users/password                                                                devise/passwords#create
 cancel_user_registration GET    /users/cancel                                                                  devise/registrations#cancel
    new_user_registration GET    /users/sign_up                                                                 devise/registrations#new
   edit_user_registration GET    /users/edit                                                                    devise/registrations#edit
        user_registration PATCH  /users                                                                         devise/registrations#update
                          PUT    /users                                                                         devise/registrations#update
                          DELETE /users                                                                         devise/registrations#destroy
                          POST   /users                                                                         devise/registrations#create
       rails_service_blob GET    /rails/active_storage/blobs/:signed_id/*filename                               active_storage/blobs#show
rails_blob_representation GET    /rails/active_storage/representations/:signed_blob_id/:variation_key/*filename active_storage/representations#show
       rails_disk_service GET    /rails/active_storage/disk/:encoded_key/*filename                              active_storage/disk#show
update_rails_disk_service PUT    /rails/active_storage/disk/:encoded_token                                      active_storage/disk#update
     rails_direct_uploads POST   /rails/active_storage/direct_uploads                                           active_storage/direct_uploads#create


post_images GET    /post_images(.:format)                                  post_images#index
          POST     /post_images(.:format)                                  post_images#create
new_post_image GET /post_images/new(.:format)                              post_images#new
post_image GET     /post_images/:id(.:format)                              post_images#show

post_image_post_comments POST   /post_images/:post_image_id/post_comments(.:format) post_comments#create

=end