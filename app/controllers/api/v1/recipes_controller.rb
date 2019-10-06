class Api::V1::RecipesController < ApplicationController
  before_action :set_recipe, only: [:show, :update, :destroy]

  # GET /recipes
  def index
    @recipes = Recipe.all

    render json: @recipes
  end

  # GET /recipes/1
  def show
    render json: @recipe
  end

  # POST /recipes
  def create
    #Find recipe or create a new recipe
    @recipe = Recipe.create_with(recipe_params).find_or_create_by(api_id: recipe_params[:api_id])

    #Find if user has this recipe's favorite
    @favorite = @recipe.favorites.find_favorite(params)      

    if !@favorite.persisted?
      @favorite = @recipe.favorites.create(like: params[:favorite][:like], review: params[:favorite][:review], user_id:params[:favorite][:user_id])

      render json: @recipe, status: :created

    elsif @favorite.persisted?
      @favorite.update(like: params[:favorite][:like], review: params[:favorite][:review])

      render json: @recipe

    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /recipes/1
  def update
    if @recipe.update(recipe_params)
      render json: @recipe
    else
      render json: @recipe.errors, status: :unprocessable_entity
    end
  end

  # DELETE /recipes/1
  def destroy
    @recipe.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_recipe
      @recipe = Recipe.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def recipe_params
      params.require(:recipe).permit(:title, :image, :api_id)
    end
end
