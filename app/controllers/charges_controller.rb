class ChargesController < ApplicationController
  before_action :authenticate_user!

  def create
  	@product = Product.find(params[:product_id])
    if current_user.products.where(id: params[:product_id]).any? 
      flash[:error] = "Cannot bid your own products!" 
      redirect_to page_path(@product)
    elsif current_user.bids.where(product_id: params[:product_id]).any?
      flash[:error] = "You already bid this product!"
      redirect_to page_path(@product) 
    end
    @amount = params[:amount].gsub('$', '').gsub(',', '')

    begin
      @amount = Float(@amount).round(2)
    rescue
      flash[:error] = 'Charge not completed. Please enter a valid amount.'
      redirect_to page_path(@product)
      return
    end

    if 
    elsif (@amount.to_i < @product.price) || ()
      flash[:error] = "Charge not completed. Amount must be at least #{@product.price}."
      redirect_to page_path(@product)
      return
    end
    customer = StripeTool.create_customer(email: params[:stripeEmail], 
                                          stripe_token: params[:stripeToken])

    charge = StripeTool.create_charge(customer_id: customer.id, 
                                      amount: @amount,
                                      description: 'Rails Stripe customer',
                                      user_id: current_user.id,
                                      product_id: params[:product_id])

    rescue Stripe::CardError => e
      flash[:error] = e.message
      redirect_to page_path(@product)
    end
end
