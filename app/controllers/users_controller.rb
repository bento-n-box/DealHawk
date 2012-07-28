require 'httparty'
class UsersController < ApplicationController
  
   def new
    @user = User.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @user }
    end
  end
  
    def create
    @user = User.new(params[:user])
    if @user.save
   	  session[:user_id] = @user.id
      flash[:success] = "Welcome to DealHawk, you just made an account"
      redirect_to @user
    else
      render 'new'
    end
    
  end
  
  
  def show
  		
  		@api_key = 'dfdf89cfb7fa01ce0041da8d98514d01b94683ca'
		@zipcode = current_user.zipcode
		url = "https://api.groupon.com/v2/deals.json?division_id=#{@zipcode}&tag=Arcade&client_id=#{@api_key}"
		
		@deal_data = HTTParty.get(url).parsed_response
		@deals =  @deal_data["deals"]
		Rails.logger.debug current_user

		
  		@user = current_user
  		@user_by_zipcode = User.find_all_by_zipcode(params[:zipcode])	 
    	
   
    	
    	
  end
end

