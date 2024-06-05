Rails.application.routes.draw do
  # Resources
  resources "entries"
  resources "places"
  resources "sessions"
  resources "users"
  resources "layouts"

  # Define the root route
  get("/", { :controller => "sessions", :action => "new" })

  # Login/logout
    get("/login", { :controller => "sessions", :action => "new" })
    get("/logout", { :controller => "sessions", :action => "destroy" })

   # Places
   get("/places", { :controller => "places", :action => "index" })   
end
