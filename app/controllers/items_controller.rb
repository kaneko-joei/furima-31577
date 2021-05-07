class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, except: [:index, :show]


  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    if user_signed_in?
       @item = Item.new
    else
       redirect_to user_session_path(@item.id)
    end
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

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end

  end


end
