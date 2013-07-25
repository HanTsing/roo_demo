#encoding: utf-8
class Project < ActiveRecord::Base
  attr_protected :project_number_id
  belongs_to :project_number

  PUBLISH_STATUS_PUBLISHED = 1 
  PUBLISH_STATUS_DELETED   = 2
  PUBLISH_STATUS_INVALID   = 3

  PUBLISH_STATUS_ARRAY = [["发布", PUBLISH_STATUS_PUBLISHED],
                          ["删除", PUBLISH_STATUS_DELETED],
                          ["无效", PUBLISH_STATUS_INVALID]] 

  scope :published, :conditions => { :publish_status => PUBLISH_STATUS_PUBLISHED }

  def published?
    self.publish_status == PUBLISH_STATUS_PUBLISHED
  end
  
  def invalid?
    self.publish_status == PUBLISH_STATUS_INVALID
  end

  class << self

    def save_project_from_external(row, number)
      name = row[1]
      project_number  = ProjectNumber.find_by_number(number)
      if project_number && name.present?
        project = assemble_data_from_row(row)
        project.project_number = project_number
        project.publish_status = PUBLISH_STATUS_PUBLISHED
        project.save
      else
        project = assemble_data_from_row(row) 
        project.publish_status = PUBLISH_STATUS_INVALID
        project.save
      end
      project
    end

    def assemble_data_from_row(row)
      project = Project.new
      project.name                  = row[1]
      project.unit                  = row[2]
      project.contact_count         = row[3]
      project.unit_price            = row[4]
      project.prior_project_count   = row[5]
      project.prior_price           = row[6]
      project.current_project_count = row[7]
      project.current_price         = row[8]
      project.project_count         = row[9]
      project.project_price         = row[10]
      project.comment               = row[11]
      project
    end

  end
end
