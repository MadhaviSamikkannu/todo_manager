require './connect_db.rb'
#require './users.rb'
class Users < ActiveRecord::Base
  #def to_pleasant_string
   # is_completed = completed ? "[X]" : "[ ]"
   # "#{id}. #{due_date.to_s(:long)} #{todo_text} #{is_completed}"
  #end

  def to_mgmt_users
    " #{id}. #{name}, #{email}, #{password}"
  end


end
