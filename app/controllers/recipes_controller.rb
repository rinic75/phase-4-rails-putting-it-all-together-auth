class RecipesController < ApplicationController
  before_action :authorize, only: [:create]

  def index 
    redner json: Recipe.all
  end

  def create
    recipe = @user.recipes.create!(recipe_params)
    render json: recipe, status: :created
  end

  private

  def recipe_params
    params.permit(:title, :instructions, :minutes_to_complete)
  end



end
