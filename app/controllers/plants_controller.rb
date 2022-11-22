class PlantsController < ApplicationController
    def index
        plants = Plant.all
        render json: plants
   
    end

    def show 
        plant = Plant.find_by(id: params[:id])
        if plant
            render json: plant
        else 
            render json: {error: "no plant found"}, status: :not_found
        end
    end

    def create
       plants = Plant.create(plants_params)
       render json: plants, status: :created
    end



    private

    def plants_params
     params.permit(:name, :image, :price)
    end
end
