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

class Product < ApplicationRecord
  belongs_to :user
  has_many :bids
  mount_uploaders :images, ImageUploader
  validates :name, :start_time, :end_time, :price, :status, presence: true
  validate :ensure_valid_time, if: :time_supplied?
  validate :ensure_images, if: :images_exist?
  validate :ensure_product_status, on: :update

  private

  def ensure_valid_time
    errors.add(:end_time, "End time should be less than or equal to start_time") if end_time <= start_time
  end

  def time_supplied?
    !(start_time.nil? || end_time.nil?)
  end

  def ensure_images
    errors.add(:images, "Uploaded images must be less tahn or equal to 5") if images.size > 5
  end

  def images_exist?
    images.size > 0
  end

  def ensure_product_status
    errors.add(:status, "Product has been up to market place") if status == STATUS[:on_bid] || status == STATUS[:bid] || status == STATUS[:sold]
  end
end
