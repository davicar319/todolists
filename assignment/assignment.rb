require_relative '../config/environment'

# Use Active Record Model methods to implement the following methods.
class Assignment

  #
  # Insert rows in DB
  #
  def create_user(params)
      user = User.new
      user.username = params[:username]
      user.password_digest = params[:password_digest]
      user.save
  end

  def create_todolist(params)
    todolist = TodoList.new
    todolist.list_name = params[:name]
    todolist.list_due_date = params[:due_date]
    todolist.save
  end

  #
  # Retrieve paginated results from DB
  #
  def find_allusers(offset, limit)
    User.offset(offset).limit(limit).to_a
  end

  def find_alllists(offset, limit)
    TodoList.order(list_due_date: :desc).offset(offset).limit(limit).to_a
  end

  #
  # Query DB with exact match
  #
  def find_user_byname(username)
    User.where(username: username).to_a
  end 

  def find_todolist_byname(name)
    TodoList.where(list_name: name).to_a
  end     

  #
  # Get rows from DB by PK
  #
  def get_user_byid(id)
    User.find(id)
  end

  def get_todolist_byid(id)
    TodoList.find(id)
  end

  #
  # Update rows in DB
  #
  def update_password(id, password_digest)
    user = User.find(id)
    user.password_digest = password_digest
    user.save
  end

  def update_listname(id, name)
    todolist = TodoList.find(id)
    todolist.list_name = name
    todolist.save
  end 

  #
  # Delete rows from DB
  #
  def delete_user(id)
    User.destroy(id)
      # accept an id input parameter
      # use the User Model class to remove the User associated with the `id` primary key from the database
      # (no return is required)
  end 

  def delete_todolist(id)
      # accept an id input parameter
      # use the TodoList Model class to get the TodoList associated with the `id` primary key.
      # (no return is required)
  end
end
