require_relative 'card'

class Deck
  #a deck of cards is an array of 52 cards

  def initialize(suits,ranks)
    @deck = []
    @suits = suits 
    @ranks = ranks
  end
end