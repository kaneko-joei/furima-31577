class PurchasesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_find, only: [:index, :create]
  before_action :redirect_to_index, only: [:index, :create]



  def index
    
    @purchase_address = PurchaseAddress.new

  end

  


  
  def create
    
    @purchase_address = PurchaseAddress.new(address_params)
    if @purchase_address.valid?
      pay_item 
        @purchase_address.save  
        return redirect_to root_path
      else
        render :index
    end

  end
  

  private
  def address_params
    params.require(:purchase_address).permit(:postal_code,:prefecture_id, :city, :addresses, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def find_params
    @item = (Item.find(params[:item_id]))
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 環境変数を読み込
        Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: address_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
        
        )
  end

  def redirect_to_index

    redirect_to root_path if current_user == @item.user || @item.purchase_management != nil 

  end

  

end
