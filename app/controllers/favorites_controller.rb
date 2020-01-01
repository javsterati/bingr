class FavoritesController < ApplicationController
    def add
        Favorite.create(show_id: params[:id].to_i, user_id: session[:user_id])
        redirect_to user_favs_path(session[:user_id])
    end

    def destroy 
        Favorite.find_by(show_id: params[:id].to_i, user_id: session[:user_id]).destroy
        redirect_to user_favs_path(session[:user_id])
    end
end
