require_relative 'blackjack'
SUITS = ['Spades','Hearts', 'Clubs', 'Diamonds']
RANKS = ['2','3','4','5','6','7','8','9','10','Jack','Queen','King', 'Ace']
game = Blackjack.new(SUITS, RANKS)

game.deal
# puts game
puts game.show_hands

while game.player_hand.get_value <= 21 do 
  puts 
  player_cards = game.player_hand.dealt_cards
  puts 'Do you want to hit(1) or stand(2)?'
  response = gets.chomp
  
  if response == '1'
    puts 'You shoose to hit.'
    game.hit
    puts "Player's hand: " + game.player_hand.to_s
    puts "Dealer's hand: " + game.dealer_hand.to_s
    puts
  elsif response == '2'
    puts 'You chose to stand.'
    game.stand
    puts "Player's hand: " + game.player_hand.to_s
    puts "Dealer's hand: " + game.dealer_hand.to_s
    puts
    break
  end
end

