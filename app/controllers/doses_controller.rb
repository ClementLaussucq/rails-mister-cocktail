class DosesController < ApplicationController
  def new
    @cocktails = Cocktail.find(params[:cocktail_id])
    @doses = Dose.new
  end

  def create

    @cocktail = Cocktail.find(params[:cocktail_id])

    @dose = Dose.new(dose_params)
    @dose.cocktail = @cocktail
    @dose.save
    redirect_to cocktail_path(@cocktail)
  end

  def destroy
  end

private
  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end

end
