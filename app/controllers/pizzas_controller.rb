class PizzasController < ApplicationController
    def index
        pizzas = Pizza.all
        render json: pizzas
    end
    def show
        pizza = Pizza.find_by(id: params[:id])
        if pizza
            render json: pizza, status: :created 
        else
            render json: {error: "Pizza not found"}, status: :not_found  
        end
    end 
   
    def destroy
        pizza = Pizza.find(params[:id])
        pizza.destroy
        head :no_content
      rescue ActiveRecord::RecordNotFound
        render json: { error: "Pizza not found" }, status: :not_found
 
    end
end
