class DosesController < ApplicationController
  before_action :find_cocktail, only: [:create, :new, :edit, :update, :destroy]
  before_action :find_dose, only: [:edit, :update, :destroy]

  def new
    @dose = @cocktail.doses.new
  end

  def create
    @dose = @cocktail.doses.new(params_set)
    @dose.save ? redirect_to(cocktail_path(@cocktail)) : render(:new)
  end

  def edit
  end

  def update
    @dose.update(params_set)
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
    @dose.destroy
    redirect_to cocktail_path(@cocktail)
  end

  private

  def find_dose
    @dose = Dose.find(params[:id])
  end

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def params_set
    params.require(:dose).permit(:ingredient_id, :description)
  end
end
