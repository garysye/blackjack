class window.BackgroundView extends Backbone.View

  tagName: 'svg'
  className: 'background'

  initialize: ->
    @render()
    @addChips()

    @model.on 'change:money', @addChips, @
    @model.on 'playerWin', @fireworks, @

  fireworks: ->
    @board.selectAll('.fireworks').remove()

    center = {y: innerHeight/2, x: innerWidth/2}

    colors = d3.scale.category10()
    range = d3.range(500)
    @board.selectAll('circle').data(range)
      .enter().append('circle')
      .classed 'fireworks', true
      .attr 'r', 20
      .style 'fill', (d,i) ->
        colors(i % 10)
      .attr 'cy', center.x
      .attr 'cx', center.y
      .transition().duration(1000)
      .attr 'cy', ->
        (Math.random() - 0.5) * 2000 + center.y
      .attr 'cx', ->
        (Math.random() - 0.5) * 2000 + center.y
      .style 'opacity', 0

  addChips: ->
    numchips = Math.floor (@model.get 'money') / 100
    numchips = Math.min numchips, 10000
    if numchips > 0 then chips = [1 .. numchips] else chips = []
    @board.selectAll('image').data chips, (key) -> 
      key
    .enter().append 'image'
    .attr 'xlink:href', 'https://cdn0.iconfinder.com/data/icons/casino-poker-cards-and-chips/154/casino-chip-gamble-game-128.png'
    .classed 'moneychip', true
    .attr 'width', 50
    .attr 'height', 50
    .attr 'y', 0
    .attr 'x', 0
    .transition().duration(1000)
    .attr 'y', ->
      Math.random() * 200 + 200
    .attr 'x', ->
      Math.random() * 200 + 300

    @board.selectAll('image').data(chips).exit().remove()

  render: ->

    @board = (d3.select '.background').attr 'height', window.innerHeight
      .attr 'width', window.innerWidth


    # this.el