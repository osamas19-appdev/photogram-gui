Rails.application.routes.draw do

  get("/users", { :controller => "users", :action => "index" })

  get("/users/:path_user", { :controller => "users", :action => "details" })

end
