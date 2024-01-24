class PlantsController < ApplicationController
  def create
    garden = Garden.find(params[:garden_id])
    @plant = Plant.new(plant_params)
    @plant.garden = garden # explicit assignment (not part of plant params)

    if @plant.save
      redirect_to garden, notice: "#{@plant.name} was successfully created!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @plant = Plant.find(params[:id])
    name = @plant.name
    garden = @plant.garden
    @plant.destroy!
    redirect_to garden, notice: "#{name} was successfully destroyed.", status: :see_other
  end

  private

  def plant_params
    params.require(:plant).permit(:name, :image_url) 
  end
end
