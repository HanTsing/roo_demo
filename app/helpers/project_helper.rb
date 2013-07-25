#encoding: utf-8
module ProjectHelper

  def display_class_of_project(project)
    project.invalid? ? "error" : ""
  end

  def project_number_options(selected = nil)
    options = [["请选择编号",nil]]
    options += ProjectNumber.all.collect{|p| [p.number, p.id] }
    options_for_select(options, selected)
  end

end
