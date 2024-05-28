class DashboardController < ApplicationController
  def index
    @categories = Category.all
    @makes = Make.all
  end
end
