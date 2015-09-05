class window.App extends Backbone.Model
  initialize: ->
    @set 'game', new Game()
    @set 'gameCount', 0
    @set 'money', 500
    @set 'currentBet', 0
    @set 'history', new HandHistory()
    (@get 'game').on 'playerWin', @playerWin, @
    (@get 'game').on 'playerLose', @playerLose, @

  playerWin: ->
    @set 'money', (@get 'money') + (@get 'currentBet')
    @trigger 'playerWin', @
    @resetGame()

  playerLose: ->
    @set 'money', (@get 'money') - (@get 'currentBet')
    @resetGame() 

  resetGame: ->
    hands = (@get 'game').hands()
    (@get 'history').unshift hands
    @set 'game', new Game()
    (@get 'game').on 'playerWin', @playerWin, @
    (@get 'game').on 'playerLose', @playerLose, @
    @set 'gameCount', (@get 'gameCount') + 1

  bet: (amount) ->
    @set 'currentBet', +amount

