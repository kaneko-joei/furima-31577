class CardsController < ApplicationController
  def new
  end

  def create
    
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"] # 環境変数を読み込む
    customer = Payjp::Customer.create(
    description: 'test', # テストカードであることを説明
    card: params[:card_token] # 登録しようとしているカード情報
    )



    if card.save
      redirect_to root_path
    else
      redirect_to action: "new" # カード登録画面
    end
  end

end
