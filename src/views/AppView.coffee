class window.AppView extends Backbone.View

  className: 'container'

  template: _.template '
    <div class="money">Cash: <%- money %></div>
    <div class="currentBet">At Stake: <%- currentBet %></div>
    <form action="#" class="bet">
      <input type="text" name="betAmount" placeholder="Set your bet here" value=0 class="betAmount"></input>
      <input type="submit" class="Bet" value="BET"></input>
    </form>
  '
  initialize: ->
    @model.on 'change:game', @render, @
    @backgroundView = new BackgroundView(model: @model).el
    @render()

  handleSubmit: (event) ->
    event.preventDefault()
    @model.bet (@$el.find '.betAmount').val()
    @render()

  events: 
    "submit" : "handleSubmit"

  render: ->
    @$el.children().detach()
    @$el.append @template @model.attributes
    @$el.append new GameView(model: @model.get 'game').el
    @$el.append new HandHistoryView(collection: @model.get 'history').el
    

