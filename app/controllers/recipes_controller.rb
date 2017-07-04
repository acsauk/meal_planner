class RecipesController < ApplicationController
  before_action :find_recipe, only: %i[edit update destroy show]

  def index
    @q = current_user.recipes.ransack(params[:q])
    @recipes = @q.result(distinct: true)
  end

  def new
    @recipe = Recipe.new
    @recipe.ingredients.build
  end

  def edit
  end

  def create
    @recipe = Recipe.new(recipe_params)
    @recipe.user = current_user
    @recipe.save
    flash[:notice] = "#{@recipe.title} recipe successfully created"
    redirect_to recipes_path
  end

  def update
    if @recipe.update(recipe_params)
      redirect_to recipes_path
    else
      render 'edit'
    end
  end

  def destroy
    @recipe.destroy
    redirect_to recipes_path
  end

  def show
  end

  def search
  end

  private

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

  def recipe_params
    params.require(:recipe).permit(
      :title, :instructions,
      quantities_attributes: [:id, :ingredient, :ingredient_id, :recipe_id, :amount,
                              :unit, :_destroy,
                              ingredient_attributes: %i[id _destroy name]]
    )
  end
end
