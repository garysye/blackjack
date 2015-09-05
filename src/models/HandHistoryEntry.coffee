class window.HandHistoryEntry extends Backbone.Model
  initialize: (hands)->
    @set "playerHand", hands["playerHand"]
    @set "dealerHand", hands["dealerHand"]



