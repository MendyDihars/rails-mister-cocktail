class CocktailsController < ApplicationController
  before_action :find_cocktail, only: [:show, :edit, :update, :destroy]

  def index
    @cocktails = Cocktail.all
  end

  def show
  end

  def new
    @cocktail = Cocktail.new
  end

  def create
    @cocktail = Cocktail.new(set_params)
    @cocktail.save ? redirect_to(cocktail_path(@cocktail)) : render(:new)
  end

  def edit
  end

  def update
    @cocktail.update(set_params)
    redirect_to cocktail(@cocktail)
  end

  def destroy
    @cocktail.destroy
    redirect_to "/"
  end

  private

  def find_cocktail
    @cocktail = Cocktail.find(params[:id])
  end

  def set_params
    params.require(:cocktail).permit(:name)
  end
end
