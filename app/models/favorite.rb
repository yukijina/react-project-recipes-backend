class Favorite < ApplicationRecord
    belongs_to :user
    belongs_to :recipe

    def self.find_favorite(params)
        where("user_id = ?", params[:favorite][:user_id]).first_or_initialize do |favorite|
            favorite.user_id = params[:favorite][:user_id]
        end
    end 
end
