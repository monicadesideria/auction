class BidsController < ApplicationController
  before_action :authenticate_user!

  def index
  	@bids = current_user.bids.order(created_at: :asc, id: :asc).page(params[:page]).per_page(10)
  end
end
