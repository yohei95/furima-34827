class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :find_item, only: [:show, :edit, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]
  before_action :move_to_root_sold_out, only: [:edit]

  def index
    @items = Item.order('created_at DESC')
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
      redirect_to item_path(@item.id)
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
    params.require(:item).permit(:name, :text, :image, :price, :category_id, :status_id, :fee_id, :prefecture_id,
                                 :day_id).merge(user_id: current_user.id)
  end

  def move_to_index
    redirect_to action: :index unless @item.user.id == current_user.id
  end

  def move_to_root_sold_out
    redirect_to root_path unless @item.purchase.nil?
  end

  def find_item
    @item = Item.find(params[:id])
  end
end
