class PagesController < ApplicationController
  def home
  	@products = Product.where(approved: true).order("updated_at desc")
  	@admin = user_signed_in?&&current_user.admin?
  end
  
  def about  	
  end
end
