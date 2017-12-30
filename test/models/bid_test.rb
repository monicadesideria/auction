# == Schema Information
#
# Table name: bids
#
#  id          :integer          not null, primary key
#  amount      :decimal(14, 2)   default(0.0)
#  user_id     :integer
#  product_id  :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#  customer_id :string
#

require 'test_helper'

class BidTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
