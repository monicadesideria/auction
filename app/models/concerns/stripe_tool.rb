module StripeTool
  def self.create_customer(email: email, stripe_token: stripe_token)
    Stripe::Customer.create(
      email: email,
      source: stripe_token
    )
  end

  def self.create_charge(customer_id: customer_id, amount: amount, description: description, user_id: user_id, product_id: product_id)
    stripe_charge = Stripe::Charge.create(
      customer: customer_id,
      amount: amount.to_i,
      description: description,
      currency: 'idr'
    )
    
    new_bid = Bid.create(
      amount: amount,
      customer_id: customer_id,
      user_id: user_id,
      product_id: product_id
    ) if stripe_charge

    product = Product.find(product_id)
    product.update_attribute(:status, STATUS[:bid]) if new_bid && product.status == STATUS[:on_bid]
    return stripe_charge
  end
end