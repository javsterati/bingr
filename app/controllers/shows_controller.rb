class ShowsController < ApplicationController
    
    def index 
        redirect_to( login_path flash[:danger] = "Login reduired") unless session.include? :user_id
        @shows = Show.all
    end

    def show 
        redirect_to( login_path flash[:danger] = "Login reduired") unless session.include? :user_id
        @show = Show.find(params[:id])
        
    end

end
