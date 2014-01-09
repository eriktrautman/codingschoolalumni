Codingschoolalumni::Application.routes.draw do

  root "users#new"

  resource :session, :only => [:new, :create, :destroy]
  resources :users, :only => [:new, :show, :pw_reset]
  post "validate_user" => "users#validate_signup"
  post "edit_user" => "users#update_pw"
  post "send_pw_reset_email" => "users#send_pw_reset_email"
  get "users/:id/pw_reset" => "users#edit_pw"
  get "request_pw_reset" => "users#request_pw_reset"
  get "/auth/linkedin/callback" => "users#create", :linkedin => true
  get "/create_user" => "users#create", :linkedin => false
  get "/thanks" => redirect("/thanks.html")
  get "anti_harassment_policy" => "static_pages#anti_harassment_policy"
  get "privacy_policy" => "static_pages#privacy_policy"

end
