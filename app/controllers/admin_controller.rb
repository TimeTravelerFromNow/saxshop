class AdminController < ApplicationController
  http_basic_authenticate_with name: Rails.application.credentials.stevegrays&.username || Rails.application.credentials.sebastians&.username,
   password: Rails.application.credentials.stevegrays&.password || Rails.application.credentials.sebastians&.password
end
