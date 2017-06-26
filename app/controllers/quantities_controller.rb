class QuantitiesController < ApplicationController

  private

  def quantity_params
    params.require(:recipe).permit(:amount,
                                   :ingredient,
                                   :ingredient_attributes)
  end
end
