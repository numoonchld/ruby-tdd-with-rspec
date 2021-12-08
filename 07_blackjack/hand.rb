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
    '10':10,
    'Jack':10,
    'Queen':10,
    'King':10,
  }
  
  attr_accessor :dealt_cards
  
  def initialize
    @dealt_cards = []
  end

  def add_card(card)
    @dealt_cards.push(card)
  end

  def get_value
    # card_ranks = @dealt_cards.map(&:rank)
    card_ranks = @dealt_cards.map { |card| card.rank }
    # card_ranks = dealt_cards.collect { |card| card.rank} # same as map

    # if card_ranks.include?('Ace')
    #   card_ranks.reduce(0) { |acc,val| acc + VALUES[val.to_sym] } + 10
    # else
    #   card_ranks.reduce(0) { |acc,val| acc + VALUES[val.to_sym].to_i }
    # end
    
    # value = 0 
    # card_ranks.each do |rank|
    #   value = value + VALUES[rank.to_sym]
    # end
    # puts card_ranks
    value = card_ranks.reduce(0) { |acc,rank| acc + VALUES[rank.to_sym]}
    if card_ranks.include?('Ace')
      value += 10 if value + 10 <= 21
    end
    value
  end

  def to_s

    report = dealt_cards.reduce('') { |acc, val| 
      if val.show
        acc + val.to_s + ', '
      else 
        acc 
      end
      }
    if dealt_cards.first.show == false
      report += "Total Value: #{get_value - VALUES[dealt_cards.first.rank.to_sym]}"
    else
       report += "Total Value: #{get_value}"
    end
  end
end