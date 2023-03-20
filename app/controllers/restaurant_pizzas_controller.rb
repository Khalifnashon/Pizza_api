class RestaurantPizzasController < ApplicationController
    rescue_from ActiveRecord::RecordInvalid, with: :render_unprocessable_entity_response
    wrap_parameters :restaurant_pizza, include: [:price, :pizza_id, :restaurant_id]

    def index
        restaurant_pizzas = RestaurantPizza.all
        render json: restaurant_pizzas, status: :ok
    end

    def create
        restaurant_pizza = RestaurantPizza.create!(restaurant_pizza_params)
        render json: restaurant_pizza.pizza, status: :created
    end
    
    private 

    def restaurant_pizza_params
        params.permit(:restaurant_id, :pizza_id, :price)
    end

    def render_unprocessable_entity_response(invalid)
        render json: { errors: invalid.record.errors }, status: :unprocessable_entity
    end

end
