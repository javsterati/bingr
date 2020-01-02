class UsersController < ApplicationController
        before_action :find, only: [:show, :edit, :update, :favs, :destroy, :edit, :recommended]
    
         def new 
             @user = User.new
             render :new, layout: 'layouts/login'
         end
    
         def create
            @user = User.new(users_params)
            if @user.save
              redirect_to login_path, notice: "CREATED ACCOUNT"
              else 
              render :new
            end 
         end 
         
         def show
         end

         def recommended
         end

         def welcome
         end

         def favs
          @user = User.find(params[:id])
          @shows = @user.shows
         end
     
         def edit

         end
     
         def update 
          if @user.update(users_params)
            redirect_to login_path, notice: "ACCOUNT UPDATE"
            else 
            render :new
          end 
         end
     
         def destroy 
            # Favorite.find_by(user_id: session[:id]).destroy
            @user.favorites.destroy
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


