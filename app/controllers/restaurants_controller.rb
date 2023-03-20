class RestaurantsController < ApplicationController
    # get all restaurants
    def index
        restaurants = Restaurant.all
        render json: restaurants
    end
    def show
        restaurants=Restaurant.find_by(id: params[:id])
        if restaurants
            render json: restaurants, include: :pizzas ,status: :created 
        else
            render json: {error: "Restaurant not found"}, status: :not_found  
        end
    end 
    def destroy
        restaurant = Restaurant.find(params[:id])
        restaurant.destroy
        head :no_content
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Restaurant not found" }, status: :not_found
 
    end
end
