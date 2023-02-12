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

end
