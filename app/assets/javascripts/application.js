// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require_tree .

$(document).ready(function() {
  var pusher = new Pusher('02d4d20f0aa125146ac8');
  var channel = pusher.subscribe('bid_channel');

  $('.bid-button').click(function() {
    $(this).addClass('disabled');
    var auctionId = $(this).data('auctionId');
    sendBidForAuction(auctionId, $(this));
  });

  function sendBidForAuction(auctionId, button) {
    $.ajax({
      type: "POST",
      url: 'bid',
      data: { auction_id: auctionId }
    });
  }

  
  channel.bind('new_bid', function(data) {
    var bid_button = $('[data-auction-id="' + data.auction_id + '"]')
    var price = bid_button.parent().find('.price');
    price.text("$" + data.price);
    bid_button.removeClass('disabled');
  });

});