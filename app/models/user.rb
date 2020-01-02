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

    def most_common_value(array)
        #This evaluates the genre array and returns the most liked genres. 
        array.group_by do |genre|
            genre
         end.values.max_by(&:size).first
    end

    def liked_genre
        @genre = self.shows.map{|show| show.genre }.compact
        most_common_value(@genre)
    end

    def reco_shows
        Show.all.find_all{|show| show.genre = self.liked_genre }
    end



# def most_common_values(array)
#     #This evaluates the genre array and returns the most liked genres. 
#     array.group_by do |genre|
#         genre
#      end.values.max_by(&:size).first
# end

# def u2
#     @favs = Favorite.all.find_all{|favorite| favorite.show.genre = self.liked_genre }
#     most_common_values(@favs).show.title
# end


end
