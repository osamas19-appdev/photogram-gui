Rails.application.routes.draw do

  get("/", { :controller => "users", :action => "index" })

  get("/users", { :controller => "users", :action => "index" })

  get("/users/:path_user", { :controller => "users", :action => "details" })

  get("/photos", { :controller => "photos", :action => "index" })

  get("/photos/:path_photo", { :controller => "photos", :action => "details" })

  get("/delete_photo/:path_photo", { :controller => "photos", :action => "delete" })

  get("/insert_photo", { :controller => "photos", :action => "insert" })

  get("/update_photo/:update_id", { :controller => "photos", :action => "update" })

  get("/insert_comment_record", { :controller => "photos", :action => "comment" })

  get("/insert_user_record", { :controller => "users", :action => "add_user" })

  get("/update_user/:user_path", { :controller => "users", :action => "update_user" })


end
