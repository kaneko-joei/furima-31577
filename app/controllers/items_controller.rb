class ItemsController < ApplicationController

  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item,only: [:show,:edit,:update,:destroy]
  before_action :item_seller_confirmation,only: [:edit,:update,:destroy]
  before_action :find_item, only: :order

  


  def index
    @items = Item.includes(:user).order("created_at DESC")
  end

  # def order 
  #   redirect_to new_card_path and return unless current_user.card.present?

  #   Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 環境変数を読み込む
  #   customer_token = current_user.card.customer_token # ログインしているユーザーの顧客トークンを定義
  #   Payjp::Charge.create(
  #     amount: @item.price, # 商品の値段
  #     customer: customer_token, # 顧客のトークン
  #     currency: 'jpy' # 通貨の種類（日本円）
  #   )

  #   ItemOrder.create(item_id: params[:id]) # 商品のid情報を「item_id」として保存する

  #   redirect_to root_path
  # end

  
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


  def destroy
    @item.destroy
    redirect_to root_path
  end
  

  private

  def item_params
    params.require(:item).permit(:image,:name, :price, :description, :status_id, :shipping_cost_id, :shipping_day_id, :category_id, :prefecture_id).merge(user_id: current_user.id)
  end


  def item_seller_confirmation
    redirect_to root_path unless current_user.id == @item.user_id
  end

  def find_item
    @item = Item.find(params[:id]) 
  end

    
end
