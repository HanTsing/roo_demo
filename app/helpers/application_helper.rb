#encoding: utf-8
module ApplicationHelper

  def display_publish_status(project)
    case project.publish_status
    when Project::PUBLISH_STATUS_PUBLISHED
      "发布"
    when Project::PUBLISH_STATUS_DELETED
      "删除"
    else
      "无效"
    end
  end

  def publish_status_options(selected = nil)
    options = [["请选择状态",nil]]
    options += Project::PUBLISH_STATUS_ARRAY
    options_for_select(options, selected)
  end

end
