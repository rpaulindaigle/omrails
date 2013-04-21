class AllController < ApplicationController
	before_filter :authenticate_user!
	before_filter do 
	  redirect_to home_path unless user_signed_in? && current_user.admin?
	end

	def all
	  @products = Product.order("created_at desc")
	end

	def index
	  @products = Product.order("created_at desc")
	end

	def edit
	  @product = Product.find(params[:id])
	end

	def show
	  @product = Product.find(params[:id])
	end

	def update
	  @product = current_user.products.find(params[:id])

	  respond_to do |format|
	    if @product.update_attributes(params[:product])
	    	format.html { redirect_to @product, notice: 'Product was successfully updated.' }
	      format.json { head :no_content }
	      else
	      format.html { render action: "edit" }
	      format.json { render json: @product.errors, status: :unprocessable_entity }
	    end
	  end
	end

end