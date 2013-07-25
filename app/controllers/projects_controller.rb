#encoding: utf-8
class ProjectsController < ApplicationController

  def index
    @projects = Project.published
  end

  def search
    status = params[:publish_status]
    status.blank? ? @notice = "请选择状态" : @projects = Project.where(publish_status: status)
    render "index"
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def update
    project = Project.find(params[:id])
    Project.update(project.id, params[:project])
    redirect_to project_url(project)
  end

  def destroy
    project = Project.find(params[:id])
    project.update_attributes(publish_status: Project::PUBLISH_STATUS_DELETED)
    redirect_to :action => "index"
  end

  def import
    result = import_excle(params[:file])
    if result.blank?
      flash[:notice] = "上传文件失败,请检查文件格式,只支持csv,xls,xlsx格式"
      redirect_to import_file_projects_url
    else
      @valid_projects   = result[:valid_project]
      @invalid_projects = result[:invalid_project]
      @notice = "注意:红色区域是不合法数据,请及时按格式修改!"  if @invalid_projects.present?
      render "import_success"
    end
  end

end
