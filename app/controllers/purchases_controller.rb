class PurchasesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]
  before_action :move_to_root, only: [:index, :create]
  before_action :move_to_root_sold_out, only: [:index, :create]

  def index
    @purchase_shipping = PurchaseShipping.new
  end

  def create
    @purchase_shipping = PurchaseShipping.new(purchase_params)
 
    if @purchase_shipping.valid?

      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
      Payjp::Charge.create(
        amount: @item.price, 
        card: purchase_params[:token],   
        currency: 'jpy'    
      )
      @purchase_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end


  def purchase_params
    params.require(:purchase_shipping).permit(:postal_code, :prefecture_id, :city, :address, :phone_number,:building).merge(user_id: current_user.id,item_id: params[:item_id], token: params[:token])
  end

  def move_to_root
    redirect_to root_path if @item.user_id == current_user.id
  end

  def move_to_root_sold_out
    redirect_to root_path if @item.purchase != nil
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

end
