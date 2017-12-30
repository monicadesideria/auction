class PagesController < ApplicationController
  before_action :find_product, only: [:show]

  def home
  	@q = Product.search(params[:q])
  	@r = @q.result
  	@products = @r.where.not(user: current_user, status: STATUS[:sold]).order(name: :asc, id: :asc).page(params[:page]).per_page(10)
  end

  def show
  	@bid = Bid.new
    @bids = @product.bids.order(created_at: :desc, id: :desc).limit(5)
  end

  private

  def find_product
  	@product = Product.find(params[:id])
  end
end
