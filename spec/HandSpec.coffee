assert = chai.assert

describe 'hand', ->
  deck = null
  hand = null

  beforeEach ->
    deck = new Deck()
    hand = new Hand()
    hand.deck = deck;
#    hand = deck.dealPlayer

  describe 'score', ->
    it 'should properly return the score', ->
      hand.add([{rank:0, suit:"Spades"},{rank:7, suit:"Diamonds"}])
      assert.strictEqual hand.scores(), 17

    it 'should properly score an Ace', ->
      hand.add([{rank:1, suit:"Diamonds"},{rank:7, suit:"Clubs"}])
      assert.strictEqual hand.scores(), 18
      hand.add([{rank:4, suit:"Clubs"}])
      assert.strictEqual hand.scores(), 12

  describe 'gameplay', ->

    it 'should not hit if the score is over 21', ->
      hand.add([{rank: 10, suit:"Diamonds"}, {rank: 5, suit:"Clubs"}, {rank:10, suit: "Hearts"}])
      hand.hit()
      assert.strictEqual hand.length, 3

    it 'should trigger "done" when the player stands', ->
      spy = sinon.spy()
      # spy.spy hand, "done"
      # hand.done()
      # assert hand.done.calledOnce

    it 'should trigger "done" when the player busts', ->
      sinon.spy hand, "done"
      numbers = [1..10]
      hand.hit for num in numbers
