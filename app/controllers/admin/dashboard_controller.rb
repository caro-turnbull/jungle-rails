class Admin::DashboardController < ApplicationController
  username = ENV['HTTP_BASIC_AUTH_USERNAME']
  password = ENV['HTTP_BASIC_AUTH_PASSWORD']
  http_basic_authenticate_with name: username, password: password
 
  
  def show
    @product_count = Product.count
    @category_count= Category.count
  end
end
