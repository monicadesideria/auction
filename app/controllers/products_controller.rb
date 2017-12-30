class ProductsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy, :show_to_market_place]
  before_action :find_product, only: [:update, :show, :edit, :destroy, :show_to_market_place]
  before_action :filter, only: [:edit, :update, :destroy]

  def index
    @q = current_user.products
    @products = @q.order(name: :asc, id: :asc).page(params[:page]).per_page(10)
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    if @product.save
      flash[:success] = "Product successfully created"
      redirect_to product_path(@product)
    else
      flash[:warning] = "Failed to create product"
      render 'new'
    end
  end

  def update
    if @product.update_attributes(product_params)
      flash[:success] = "Product successfully updated"
      redirect_to product_path(@product)
    else
      flash[:warning] = "failed to update product"
      render 'edit'
    end
  end

  def destroy
    if @product.destroy
      flash[:success] = "Product successfully destroyed"
    else
      flash[:warning] = "Failed to destroy product"
    end
    redirect_to products_path
  end

  def show_to_market_place
    if @product.update_attribute(:status, STATUS[:on_bid])
      flash[:success] = "Product successfully up to market place"
    else
      flash[:warning] = "Failed to show product to market place"
    end
    redirect_to products_path
  end

  def filter
    flash[:warning] = "Forbidden access" if @product.user != current_user
  end

  private

  def product_params
    params.require(:product).permit(:name, :detail, :start_time, :end_time, :price, {images: []})
  end

  def find_product
    @product = Product.find(params[:id])
  end
end
