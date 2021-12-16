class ApplicationController < ActionController::Base
  http_basic_authenticate_with name: Rails.application.credentials.basic_auth_name!, password: Rails.application.credentials.basic_auth_password!
end
