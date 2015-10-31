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
      # accept an id input parameter
      # use the User Model class to get the User associated with the `id` primary key
      # return the User instance that matches the provided id
  end

  def get_todolist_byid(id)
      # accept an id input parameter
      # use the TodoList Model class to get the TodoList associated with the `id` primary key
      # return the TodoList instance that matches the provided id
  end

  #
  # Update rows in DB
  #
  def update_password(id, password_digest)
      # accept an id and password_digest input parameters
      # use the User Model class to update the `password_digest` for the User associated with the id primary key
      # (no return is required)
  end

  def update_listname(id, name)
      # accept an id and name input parameters
      # use the TodoList Model class to update the `list_name` for the TodoList associated with id primary key 
      # (no return is required)
  end 

  #
  # Delete rows from DB
  #
  def delete_user(id)
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
