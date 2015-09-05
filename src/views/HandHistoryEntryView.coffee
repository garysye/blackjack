class window.HandHistoryEntryView extends Backbone.View
  tagName: 'tr'

  initialize: ->
    @render()

  render: ->
    dealerHandView = new HandView collection: (@model.get 'dealerHand')
    playerHandView = new HandView collection: (@model.get 'playerHand')

    this.$el.append("<td>#{playerHandView.$el.html()}</td><td>#{dealerHandView.$el.html()}</td>")
