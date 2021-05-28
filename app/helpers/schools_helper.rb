module SchoolsHelper
  def school_link(school)
    if @user && current_user.has_role?(:admin)
      link_to new_user_school_user_school_url(@user, school) do
        school.name
      end
    else
      link_to school_url(school) do
        school.name
      end
    end
  end
end