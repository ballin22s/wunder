class UsersController < ApplicationController
  before_action :logged_in_user, only: [:index, :edit, :update, :destroy, :address, :payment, :update_address]
  before_action :correct_user,   only: [:edit, :update, :address, :update_address]
  before_action :admin_user,     only: :destroy
  
  #Show All Users 
  def index
    @users = User.where(activated: true).paginate(page: params[:page])
  end
  
  #New User Form
  def new
    @user = User.new
  end
  
  #User Profile
  def show
    @user = User.find(params[:id])
    #redirect_to root_url and return unless FILL_IN
  end
  
  #CREATE User
  def create
    @user = User.new(user_params)
    if @user.save
      @user.send_activation_email
      flash[:info] = "Please check your email to activate your account."
      redirect_to root_url
    else
      render 'new'
    end
  end
  
  #Edit User Pofile Form
  def edit
    @title = "Edit Profile"
    @user = User.find(params[:id])
  end
  
  #Edit Adderess Form
  def address
    @title = "Edit Address"
    @user = User.find(current_user.id)
  end
  
  #Eventually Edit Payment
  def payment
    @title = "Edit Payment"
    @user = User.find(current_user.id)
  end
  
  #Update User Profile
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to edit_user_path(@user)
    else
      render 'edit'
    end
  end
  
  #Update User Address
  def update_address
    @user = User.find(params[:id])
    if @user.update_attributes(address_params)
      flash[:success] = "Address updated"
      redirect_to address_user_path(@user)
    else
      render 'address'
    end
  end
  
  #Destroy USER
  def destroy
    User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end
    
  private
    
    #user params for profile
    def user_params
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
    
    #user params for address
    def address_params
      params.require(:user).permit(:phone, :address1, :address2, :city, :state, :zip_code)
    end
    
    # Before filters
    
    # Confirms a logged-in user.
    def logged_in_user
      unless logged_in?
        store_location
        flash[:danger] = "Please log in."
        redirect_to login_url
      end
    end
    
    # Confirms the correct user.
    def correct_user
      @user = User.find(params[:id])
      redirect_to(root_url) unless current_user?(@user)
    end
    
    # Confirms an admin user.
    def admin_user
      redirect_to(root_url) unless current_user.admin?
    end
end
