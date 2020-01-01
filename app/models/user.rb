class User < ApplicationRecord
    has_many :favorites
    has_many :shows, through: :favorites
    validates :name, presence: true
    validates :username, presence: true
    validates :username, uniqueness: true
    validates :password, presence: true
    validates :password, confirmation: { case_sensitive: true }
    before_save :downcase_user

    def downcase_user
       self.username.downcase!
    end

    def liked_genre
        @user_shows = self.shows
        @genres = @user_shows.map do |show|
            show.genre
        end
        byebug
    end


end
