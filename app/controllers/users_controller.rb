require 'date'
require 'active_support/all'

class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token


  def index
    render plain: Users.all.map{|users| users.to_mgmt_users}.join("\n")
  end



  #def show_user1
    #render plain: "Success"
    #user_name= params[:name]
    #user = Users.where("name =?",user_name)
    #response_text = "True"
    #render plain: response_text
  #end

  def show
   #render plain: "Success"
   user_id= params[:id]
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



  def login

    user_email = Users.where("email =? and password=? ",params[:email],params[:password]).count

    if (user_email==0)

         render plain: "false"
    else
        render plain: "true"
    end
  end


end
