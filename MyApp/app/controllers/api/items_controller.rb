# app/controllers/api/items_controller.rb
class Api::ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  end
  