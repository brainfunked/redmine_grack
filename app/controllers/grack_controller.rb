class GrackController < ApplicationController
  unloadable

  before_filter :find_optional_project, :authorize

  def r
    render :text => "OK"
  end

  def rw
    render :text => "OK"
  end

  private

  # Overriding the main find_optional_project, which needs
  # a numeric id, but we have a textual id.
  def find_optional_project
    @project = (Project.find(params[:project_id]) || Project.find_by_name(params[:project_id].to_s)) unless params[:project_id].blank?
    allowed = User.current.allowed_to?({:controller => params[:controller], :action => params[:action]}, @project, :global => true)
    allowed ? true : deny_access
  rescue ActiveRecord::RecordNotFound
    render_404
  end
end
