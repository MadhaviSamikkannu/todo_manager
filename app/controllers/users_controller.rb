require 'date'
require 'active_support/all'

class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token

  def index
    render plain: Users.all.map{|users| users.to_mgmt_users}.join("\n")
  end

  def show_user
    #render plain: "Success"
    user_id = params[:id]
    user = Users.find(user_id)
    render plain: user.to_mgmt_users
  end

  def create
    user_name = params[:name]
    user_email = params[:email]
    user_password =params[:password]
    new_user = Users.create!(
     name: user_name,
     email: user_email,
     password: user_password,
     )
      response_text = "Hey i am creating new name with the id #{new_user.id}"
     render plain: response_text
   end

  #def login
  #  user_email = Users.find_by(email: params[:email])
  #   if user_email && Users.{params[:password]}
  #      render plain: "True"
  #   else
   #    render plain: "False"
  #   end
  #end

  # def update
  #  id = params[:id]
   # user_name = params[:name]
  #  user_email = params[:email]
   # user_password = params[:password]
  #  user = Users.find(id)
    #users.name = user_name
   # users.email = user_email
  #  users.password = user_password
  #  users.save
   # render plain: " Updated user record status to #{user_name},#{user_email},#{user_password}"
  #end
end
