class Admin::DashboardController < AdminController
  def index
    @categories = Category.all
    @makes = Make.all
  end
end
