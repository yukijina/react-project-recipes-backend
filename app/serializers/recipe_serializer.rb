class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :title, :image, :api_id
  has_many :favorites, serializer: RecipeFavoriteSerializer
end
