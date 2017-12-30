class BidCheckerJob < ApplicationJob
  queue_as :default

  def perform
    products = Product.where(end_time: DateTime.now)
    products.each do |product|
      product.status = STATUS[:sold]
      winner = product.bids.where("amount >= ?", product.price).order('created_at DESC').last
      product.winner_id = winner.user_id
      product.save!
      winner.update_attribute(:win_status, BID_STATUS[:win])

      not_winners = product.bids.where.not(user_id: winner.user_id)
      not_winners.each do |nw|
        nw.update_attribute(:win_status, BID_STATUS[:not_win])
      end

      puts "ID = #{product.id}"
    end
  end
end
