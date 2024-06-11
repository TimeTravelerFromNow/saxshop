class ApplicationController < ActionController::Base
  before_action :is_admin_path

  def is_admin_path
    @admin_path = request.path.start_with?('/admin')
  end
end
