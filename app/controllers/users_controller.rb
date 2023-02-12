class UsersController < ApplicationController

  def index
    
    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc })
    render ({ :template => "users_template/index.html.erb" })

  end

  def details
    
    url_user = params.fetch("path_user")
    matching_users = User.where({ :username => url_user })
    @the_user = matching_users.at(0)
    render ({ :template => "users_template/details.html.erb" })

  end

  def add_user

    input_user = params.fetch("input_username")
    
    a_new_user = User.new
    a_new_user.username = input_user

    a_new_user.save

    redirect_to("/users/" + a_new_user.username.to_s)

  end

  def update_user
    
    url_user_update = params.fetch("user_path")
    matching_users = User.where({ :username => url_user_update })
    the_user = matching_users.at(0)

    input_username = params.fetch("input_username")
    
    the_user.username = input_username

    the_user.save

    redirect_to("/users/" + the_user.username.to_s)

  end
end
