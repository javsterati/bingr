class UsersController < ApplicationController
  before_action :find, only: [:show, :edit, :update, :favs, :destroy, :edit]

   def new 
       @user = User.new
       render :new, layout: 'layouts/login'
   end

   def welcome
      render :welcome , layout: 'layouts/welcome'
   end

   def create
      @user = User.new(users_params)
      if @user.save
        redirect_to login_path, notice: "CREATED ACCOUNT"
        else 
        render :new, layout: 'layouts/login'
      end 
   end 
   
   def show
    redirect_to( login_path flash[:danger] = "Login reduired") unless session.include? :user_id
   end

   def favs
    redirect_to( login_path flash[:danger] = "Login reduired") unless session.include? :user_id
    @user = User.find(params[:id])
    @shows = @user.shows
    
   end

   def recommended
    redirect_to( login_path flash[:danger] = "Login reduired") unless session.include? :user_id
    @user = User.find(session[:user_id])
    @shows = @user.shows
   end

   def edit
    redirect_to( login_path flash[:danger] = "Login reduired") unless session.include? :user_id
   end

   def update 
    redirect_to( login_path flash[:danger] = "Login reduired") unless session.include? :user_id
    if @user.update(users_params)
      redirect_to login_path, notice: "ACCOUNT UPDATE"
      else 
      render :new
    end 
   end

   def destroy 
      redirect_to( login_path flash[:danger] = "Login reduired") unless session.include? :user_id
      @user.favorites.destroy
      @user.shows.destroy
      session[:user_id] = nil
      if @user.destroy
        redirect_to login_path, notice: "DELETED ACCOUNT"
      else 
        "nope"
      end 
   end

   private 

   def find 
     @user =  User.find(params[:id])
   end

   def users_params
      params.require(:user).permit(:name, :age, :username, :password, :password_confirmation)
   end
end