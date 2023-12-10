# app/controllers/api/items_controller.rb
class Api::ItemsController < ApplicationController
    before_action :set_item, only: [:show, :edit, :update, :destroy]
    skip_before_action :verify_authenticity_token
  
    def index
      @items = Item.all
      render json: @items
    end
  
    def show
      render json: @item
    end
  
    def new
      @item = Item.new
    end
  
    def create
      @item = Item.new(item_params)
  
      if @item.save
        render json: @item, status: :created, location: api_item_url(@item)
      else
        render json: @item.errors, status: :unprocessable_entity
      end
    end
  
    def edit
      # Acciones para editar un item
    end
  
    def update
      if @item.update(item_params)
        render json: @item
      else
        render json: @item.errors, status: :unprocessable_entity
      end
    end
  
    def destroy
      @item.destroy
      head :no_content
    end
  
    private
  
    def set_item
      @item = Item.find(params[:id])
    end
  
    def item_params
      params.require(:item).permit(:name, :description)
    end
  end
  