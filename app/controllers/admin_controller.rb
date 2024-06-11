class AdminController < ApplicationController
  http_basic_authenticate_with name: Rails.application.credentials.stevegrays&.username, password: Rails.application.credentials.stevegrays&.password
end
