require 'date'
require 'active_support/all'

class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token


  def index
    render plain: User.all.map{|users| users.to_mgmt_users}.join("\n")
  end


  def show
   user_id= params[:id]
   user = User.find(user_id)
   render plain: user.to_mgmt_users
  end

  def create
    name = params[:name]
    email = params[:email]
    password =params[:password]
    new_user = User.create!(
     name: name,
     email: email,
     password: password,
     )
      response_text = "Hey i am creating new name with the id #{new_user.id}"
      render plain: response_text
   end


   def login
    email = params[:email]
    password = params[:password]
    user = User.where(email: email, password: password).exists?
    render plain: user
  end


end
