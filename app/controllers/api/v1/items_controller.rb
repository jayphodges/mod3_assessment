class Api::V1::ItemsController < ApplicationController

  def index
    render json: Item.all
  end

  def show
    render json: Item.find(params[:id])
  end

  def create
    render json: Item.create(item_params), status: 204
  end

  def destroy
    item = Item.find(params[:id])
    if item
      item.destroy
      render json: item, status: 204
    else
      render json: item, status: 404
    end
  end

  private

    def item_params
      params.require(:item).permit(:name, :description, :image_url)
    end
end
