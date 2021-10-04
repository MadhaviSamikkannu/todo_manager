require './connect_db.rb'
#require './users.rb'
class User < ActiveRecord::Base

  def to_mgmt_users
    " #{id}. #{name}, #{email}, #{password}"
  end

end
