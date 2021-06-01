module UsersHelper
  def user_index_name
    if @school_users
      "All Users in #{@school.name}"
    else
      "All Users"
    end
  end
end