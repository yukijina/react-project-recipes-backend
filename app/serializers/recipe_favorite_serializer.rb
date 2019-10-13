class RecipeFavoriteSerializer < ActiveModel::Serializer
  attributes :id, :like, :review, :user_id, :recipe_id, :user_name
end
