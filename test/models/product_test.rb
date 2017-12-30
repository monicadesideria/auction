# == Schema Information
#
# Table name: products
#
#  id         :integer          not null, primary key
#  name       :string
#  detail     :text
#  start_time :datetime
#  end_time   :datetime
#  price      :decimal(14, 2)   default(0.0)
#  status     :integer          default(1)
#  user_id    :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  images     :json
#

require 'test_helper'

class ProductTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
