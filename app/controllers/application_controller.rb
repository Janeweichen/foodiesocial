class ApplicationController < ActionController::Base
  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found 
  before_action :find_category, unless: :backend?
  helper_method :current_cart
  include Pagy::Backend


  private
  def record_not_found
    render file: "#{Rails.root}/public/404.html",
           layout: false,
           status: 404
  end
  
  def backend?
   controller_path.split('/').first =='Admin'
  end
   
  def find_category
    @categories = Category.order(position: :asc)
  end

  def current_cart
   @foodie_cart ||= Cart.from_hash(session[:foodie_cart])    
  end
end
