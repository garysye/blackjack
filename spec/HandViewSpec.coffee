  assert = chai.assert

describe 'deck', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = deck.dealPlayer()

  describe 'display', ->
    it 'should display the right score', ->

    it 'should update when a card is dealt' ->