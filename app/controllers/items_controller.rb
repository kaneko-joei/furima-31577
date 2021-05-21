class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item,only: [:show,:edit,:update]
  before_action :item_seller_confirmation,only: [:edit,:update]

  


  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  def new
    @item = Item.new
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
   end
    
    def edit
    end 
      
    def update
      if @item.update(item_params)
        redirect_to root_path
      else
        render :edit
      end
      
    end


  # def destroy
  #   @item.destroy
  #   redirect_to root_path
  # end
  

  private

  def item_params
    params.require(:item).permit(:image,:name, :price, :description, :status_id, :shipping_cost_id, :shipping_day_id, :category_id, :prefecture_id).merge(user_id: current_user.id)
  end

  
   def set_item
     @item = Item.find(params[:id])
   end

  def item_seller_confirmation
    redirect_to root_path unless current_user.id == @item.user_id
  end
    
end
