module StudentsHelper
  def student_index_name
    if @school_students
      "All Students in #{@school.name}"
    else
      "All Students"
    end
  end
end