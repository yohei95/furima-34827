class PurchasesController < ApplicationController

  def index
    @item= Item.find(params[:item_id])
    @purchase_shipping = PurchaseShipping.new
  end

  def create
    @purchase_shipping = PurchaseShipping.new(purchase_params)
    @item= Item.find(params[:item_id])

    if @purchase_shipping.valid?
      @purchase_shipping.save
      redirect_to root_path
    else
      render :index
    end
  end

  def purchase_params
    params.require(:purchase_shipping).permit(:postal_code, :prefecture_id, :city, :address, :phone_number).merge(user_id: current_user.id)
  end
end
