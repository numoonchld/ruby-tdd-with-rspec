class Hand

  VALUES = {
    'Ace':1,
    '2':2,
    '3':3,
    '4':4,
    '5':5,
    '6':6,
    '7':7,
    '8':8,
    '9':9,
    'Jack':10,
    'Queen':10,
    'King':10,
  }

  attr_accessor :dealt_cards
  
  def initialize
    @dealt_cards = []
  end

  def add_card(card)
    dealt_cards.push(card)
  end

  def get_value
    card_ranks = dealt_cards.map(&:rank)
    # card_ranks = dealt_cards.map { |card| card.rank}
    # card_ranks = dealt_cards.collect { |card| card.rank} # same as map
    if card_ranks.include?('Ace')
      card_ranks.reduce(0) { |acc,val| acc + VALUES[val.to_sym] } + 10
    else
      card_ranks.reduce(0) { |acc,val| acc + VALUES[val.to_sym] }
    end
    # value = 0 
    # card_ranks.each do |rank|
    #   value = value + VALUES[rank.to_sym]
    # end
    # value
  end
end