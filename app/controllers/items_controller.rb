class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, except: [:index, :show]


  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end

  # def destroy
  #   @item.destroy
  #   redirect_to root_path
  # end
  

  private

  def item_params
    params.require(:item).permit(:image,:name, :price, :description, :status_id, :shipping_cost_id, :shipping_day_id, :category_id, :prefecture_id).merge(user_id: current_user.id)
  end

  

end
