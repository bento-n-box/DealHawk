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
      flash[:success] = "Welcome to the Sample App!"
      redirect_to @user
    else
      render 'new'
    end
    
  end
  
  
  def show
  
  	@user = User.find(params[:id])
  	
 	respond_to do |format|
 		format.html # new.html.erb
      	format.json { render json: @user }
    	format.js
    	end
    
  end
end

