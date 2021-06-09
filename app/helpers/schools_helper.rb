module SchoolsHelper
  def school_link(school)
    if @user && current_user.has_role?(:admin)
      link_to new_user_school_user_school_url(@user, school) do
        "<i class='fa fa-link'></i>".html_safe + " " + school.name
      end
    elsif @student && current_user.has_role?(:admin)
      link_to new_student_school_student_school_url(@student, school) do
        "<i class='fa fa-link'></i>".html_safe + " " + school.name
      end
    else
      link_to school_url(school) do
        "<i class='fa fa-link'></i>".html_safe + " " + school.name
      end
    end
  end

  def add_user_to_class_with_count(user, standard)
    user_class_count = UserStandardAcademicYear.where("user_id = :user_id AND standard_id= :standard_id", user_id: @user.id, standard_id: standard.id).count
    link_to new_user_standard_user_standard_academic_year_url(user, standard), class: "button is-link is-small" do
      "<span class='tag is-primary'>".html_safe +  user_class_count.to_s + "</span>".html_safe + "Add user to this class"
    end
  end
end