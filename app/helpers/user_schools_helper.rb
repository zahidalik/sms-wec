module UserSchoolsHelper
  def admin_add_school_button
    if current_user.has_role?(:admin)
      link_to user_schools_url(@user), class: "notification is-info" do
        "<i class='fa fa-user'></i>".html_safe + "| Add user to a new school |" + "<i class='fas fa-school'></i>".html_safe
      end  
    end
  end
end