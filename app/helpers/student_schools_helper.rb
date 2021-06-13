module StudentSchoolsHelper
  def admin_add_school_button_student
    if user_signed_in_non_student?
      if current_user.has_role?(:admin)
        link_to student_schools_url(@student), class: "button is-link is-small" do
          "<i class='fa fa-user'></i>".html_safe + "| Add student to a new school |" + "<i class='fas fa-school'></i>".html_safe
        end  
      end
    end
  end
end