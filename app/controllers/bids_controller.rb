class BidsController < ApplicationController
  
  def new 
    if current_user
      bid = Bid.new(bid_params)
      bid.user_id = current_user.id
      bid.save
      return render json: bid
    else
      return render json: { message: 'User needs to be authenticated.' }, status: 500
    end
  end

  private

  def bid_params
    bid_params = params
    bid_params ? bid_params.permit(:auction_id) : {}
  end
end
