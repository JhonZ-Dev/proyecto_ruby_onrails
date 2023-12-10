# app/controllers/api/items_controller.rb
class Api::ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]
  skip_before_action :verify_authenticity_token

  def index
    @items = Item.all
    render json: @items
  end

  end
  