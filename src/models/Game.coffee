class window.Game extends Backbone.Model
  initialize: ->
    @set 'deck', deck = new Deck()
    @set 'playerHand', deck.dealPlayer()
    @set 'dealerHand', deck.dealDealer()

    (@get 'playerHand').on 'done', @dealerTurn, @

  dealerTurn: ->
    (@get 'dealerHand').first().flip()
    if (@get 'playerHand').scores() > 21
      return @playerLose()
    while (@get 'dealerHand').scores() < 17 
      (@get 'dealerHand').hit()
    if (@get 'dealerHand').scores() > 21
      return @playerWin()
    @countScores()

  countScores: ->
    if (@get 'playerHand').scores() > (@get 'dealerHand').scores()
      @playerWin()
    else @playerLose()

  playerWin: ->
    alert 'You win!'
    @trigger 'playerWin', @

  playerLose: ->
    alert 'You lose :('
    @trigger 'playerLose', @
