class RecipeSerializer < ActiveModel::Serializer
  attributes :id, :title, :image
  has_many :favorites, serializer: RecipeFavoriteSerializer
end
