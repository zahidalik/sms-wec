module StandardsHelper
  def standard_title
    if !params[:user_id] && !params[:student_id]
      "<div class='title has-text-centered'>".html_safe + "Info for #{@standard.name}  #{@standard.section}" + "</div>".html_safe
    elsif params[:student_id] || params[:user_id]
      "<div class='title has-text-centered'>".html_safe + @standard.name + ' ' + @standard.section + "</div>".html_safe
    end
  end
end