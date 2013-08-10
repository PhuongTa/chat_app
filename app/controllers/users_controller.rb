class UsersController < ApplicationController
  
  def index  	
  end

  def show
    @user = User.find(params[:id])
  end

  def new
    @user= User.new(params[:user])
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      sign_in @user # Su dung ham sign_in ben session help
      # Handle a successful save
      flash[:success] = "Welome to the  Chat app!"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end
end
