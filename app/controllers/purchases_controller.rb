class PurchasesController < ApplicationController


  def index
    @item = (Item.find(params[:item_id]))
    @purchase_address = PurchaseAddress.new

    redirect_to root_path unless @item.purchase_management == nil 

    redirect_to root_path if current_user == @item.user



  end

  


  
  def create
    @item = (Item.find(params[:item_id]))
    @purchase_address = PurchaseAddress.new(address_params)
    if @purchase_address.valid?
        Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 環境変数を読み込む
        

        Payjp::Charge.create(
        amount: @item.price,  # 商品の値段
        card: address_params[:token],    # カードトークン
        currency: 'jpy'                 # 通貨の種類（日本円）
        
        )
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

  
end
