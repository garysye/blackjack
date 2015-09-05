class window.BackgroundView extends Backbone.View

  el: '<svg>'

  initialize: ->
    @render()
    @animateD3()

  animateD3: ->

  render: ->
    numchips = Math.floor (@model.get 'money') / 100
    chips = [1 .. numchips]
    d3.select(".container").selectAll('.chips').data(chips)
      .enter().append 'image'
      .classed 'chips', true


    this.el