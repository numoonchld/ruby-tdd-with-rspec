require_relative 'card'
require_relative 'hand'

card_a = Card.new('Diamonds','Jack')
card_b = Card.new('Clubs','Ace')

hand = Hand.new
hand.add_card card_a
hand.add_card card_b

puts hand
puts hand.get_value