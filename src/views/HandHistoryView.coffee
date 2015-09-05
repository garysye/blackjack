class window.HandHistoryView extends Backbone.View
  tagName: 'table'
  className: 'history'

  initialize: ->
    @render()
    @collection.on "add", @render, @

  render: ->
    @$el.empty()
    node = @collection.map (model)->
      (new HandHistoryEntryView model: model).$el
    @$el.append(node)

