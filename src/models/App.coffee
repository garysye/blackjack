class window.App extends Backbone.Model
  initialize: ->
    @set 'game', new Game()
    @set 'gameCount', 0
    @set 'money', 500
    @set 'currentBet', 0
    (@get 'game').on 'playerWin', @playerWin, @
    (@get 'game').on 'playerLose', @resetGame, @

  playerWin: ->
    @set 'money', (@get 'money') + (@get 'currentBet') * 2
    @resetGame()

  resetGame: ->
    @set 'game', new Game()
    (@get 'game').on 'playerWin', @playerWin, @
    (@get 'game').on 'playerLose', @resetGame, @
    @set 'gameCount', (@get 'gameCount') + 1

  bet: (amount) ->
    @set 'currentBet', amount
    @set 'money', (@get 'money') - amount 

