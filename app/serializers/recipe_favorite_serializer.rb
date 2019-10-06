class RecipeFavoriteSerializer < ActiveModel::Serializer
  attributes :id, :like, :review, :user_id, :recipe_id
end
