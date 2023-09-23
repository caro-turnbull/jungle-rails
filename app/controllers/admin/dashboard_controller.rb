class Admin::DashboardController < ApplicationController
  username = ENV['HTTP_BASIC_AUTH_USERNAME']
  password = ENV['HTTP_BASIC_AUTH_PASSWORD']
  puts "UserName: #{username}"
puts "PassWord: #{password}"
  http_basic_authenticate_with name: username, password: password
 

  def show
  end
end
