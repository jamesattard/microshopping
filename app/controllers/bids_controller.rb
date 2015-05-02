class BidsController < ApplicationController
  
  def new 
    if current_user
      bid = Bid.new(bid_params)
      bid.user_id = current_user.id
      bid.save

      auction = bid.auction
      price = auction.price
      bid.price = price + 1
      bid.save
      auction.price = price + 1
      auction.save
      Pusher['bid_channel'].trigger('new_bid', {
        auction_id: bid.auction_id,
        price: bid.price
      })
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
