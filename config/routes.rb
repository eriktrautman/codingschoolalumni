Codingschoolalumni::Application.routes.draw do

  root "users#new"

  resources :users, :only => [:new]
  post "validate_user" => "users#validate_signup"
  get "/auth/linkedin/callback" => "users#create", :linkedin => true
  get "/create_user" => "users#create", :linkedin => false
  get "/thanks" => redirect("/thanks.html")

end
