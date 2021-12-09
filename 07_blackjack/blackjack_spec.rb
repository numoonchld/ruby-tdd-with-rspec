require_relative 'blackjack'

RSpec.describe Blackjack do
  SUITS = ['Spades','Hearts', 'Clubs', 'Diamonds']
  RANKS = ['2','3','4','5','6','7','8','9','10','Jack','Queen','King', 'Ace']

  before do 
    @blackjack = Blackjack.new(SUITS,RANKS)
  end

  describe 'instance methods' do
    it 'responds to #dealer_hand' do
      expect(@blackjack).to respond_to :dealer_hand
    end
    it 'responds to #player_hand' do
      expect(@blackjack).to respond_to :player_hand
    end
    it 'responds to #playing' do
      expect(@blackjack).to respond_to :playing
    end
    it 'responds to #current_gamer' do
      expect(@blackjack).to respond_to :current_gamer
    end
    it 'responds to #deck' do
      expect(@blackjack).to respond_to :deck
    end
    it 'responds to #deal' do
      expect(@blackjack).to respond_to :deal
    end
    it 'responds to #hit' do
      expect(@blackjack).to respond_to :hit
    end
    it 'responds to #stand' do
      expect(@blackjack).to respond_to :stand
    end
    it 'responds to #show_hands' do
      expect(@blackjack).to respond_to :show_hands
    end
    it 'responds to #set_results' do
      expect(@blackjack).to respond_to :set_results
    end
  end

  describe 'dealing cards' do
    before do 
      @blackjack.deal
      @dealer_cards = @blackjack.dealer_hand.dealt_cards
      @player_cards = @blackjack.player_hand.dealt_cards
    end

    it 'returns two cards for the dealer and the player' do
      expect(@dealer_cards.count).to eq 2
      expect(@player_cards.count).to eq 2
    end

    it 'does not display the dealers first card' do
      expect(@dealer_cards.first.show).to eq false
    end

    it 'ends player turn if blackjack' do 
      card_a = Card.new('Clubs','10')
      card_b = Card.new('Hearts','Ace')
      card_c = Card.new('Clubs','3')

      card_d = Card.new('Diamonds','10')
      card_e = Card.new('Diamonds','King')
      card_f = Card.new('Hearts','Queen')

      @blackjack  = Blackjack.new(SUITS, RANKS)
      
      # create a 6 card deck to perform tests
      new_deck = [card_d, card_e, card_b, card_c, card_a, card_f]
      @blackjack.deck.replace_with new_deck
      @blackjack.deal
      expect(@blackjack.current_gamer).to eq 'Dealer'  
    end
  end

  describe 'hitting a hand' do

    before do
      @blackjack.deal
      @dealer_cards = @blackjack.dealer_hand.dealt_cards
      @player_cards = @blackjack.player_hand.dealt_cards
    end

    it 'can hit if playing is set to true' do
      expect(@blackjack.playing).to eq true
    end

    it 'returns 2 cards for dealer but after hit, player will have 3 cards' do
      @blackjack.hit

      expect(@dealer_cards.count).to eq 2
      expect(@player_cards.count).to eq 3
    end
    it 'correctly determines if player is busted' do 
      # player cards
      card_a = Card.new('Clubs','10')
      card_b = Card.new('Hearts','10')
      card_c = Card.new('Diamonds','2')
      
      # dealer cards
      card_d = Card.new('Spades','10')
      card_e = Card.new('Clubs','10')
      card_f = Card.new('Hearts','Queen')

      @blackjack = Blackjack.new(SUITS, RANKS)
      
      # create a 6 card deck to perform tests
      new_deck = [card_f, card_c, card_b, card_e, card_a, card_d]
      @blackjack.deck.replace_with new_deck
      @blackjack.deal
      @blackjack.hit
      expect(@blackjack.result).to eq 'Player busted!'  
    end
    it 'correctly determines if dealer is busted' do 
      # player cards
      card_a = Card.new('Clubs','10')
      card_b = Card.new('Hearts','Ace')
      card_c = Card.new('Diamonds','Ace')
      
      # dealer cards
      card_d = Card.new('Spades','10')
      card_e = Card.new('Clubs','10')
      card_f = Card.new('Hearts','Queen')

      @blackjack  = Blackjack.new(SUITS, RANKS)
      
      # create a 6 card deck to perform tests
      new_deck = [card_f, card_c, card_b, card_e, card_a, card_d]
      @blackjack.deck.replace_with new_deck
      @blackjack.deal
      @blackjack.hit
      @blackjack.current_gamer = 'Dealer'
      @blackjack.hit
      expect(@blackjack.result).to eq 'Dealer busted!'  
    end
  end

  describe 'standing' do
    before do 
      @blackjack = Blackjack.new(SUITS, RANKS)
    end

    it 'gamer switches to DEALER when PLAYER stands' do
      # player cards
      card_a = Card.new('Clubs','10')
      card_b = Card.new('Hearts','Ace')
      card_c = Card.new('Diamonds','Ace')
      
      # dealer cards
      card_d = Card.new('Spades','10')
      card_e = Card.new('Clubs','3')
      card_f = Card.new('Hearts','Queen')
      
      # create a 6 card deck to perform tests
      new_deck = [card_f, card_c, card_b, card_e, card_a, card_d]
      @blackjack.deck.replace_with new_deck
      @blackjack.deal
      @blackjack.hit
      @blackjack.stand

      expect(@blackjack.current_gamer).to eq("Dealer")
    end

    it 'Dealer automatically hits if hand value < 17, and first card is face up' do 
      # player cards
      card_a = Card.new('Clubs','10')
      card_b = Card.new('Hearts','10')
      card_c = Card.new('Diamonds','Ace')
      
      # dealer cards
      card_d = Card.new('Spades','10')
      card_e = Card.new('Clubs','3')
      card_f = Card.new('Hearts','Queen')
      
      # create a 6 card deck to perform tests
      new_deck = [card_f, card_c, card_b, card_e, card_a, card_d]
      @blackjack.deck.replace_with new_deck
      @blackjack.deal
      expect(@blackjack.dealer_hand.get_value).to eq 13

      @blackjack.hit #player hits
      @blackjack.stand # player stands

      expect(@blackjack.dealer_hand.get_value).to eq 23
      expect(@blackjack.dealer_hand.dealt_cards.first.show).to eq true
    end
  end

  describe 'showing hands' do
    before do
      @blackjack = Blackjack.new(SUITS, RANKS)
      @blackjack.deal 
    end

    it 'displays player hand' do
      expect(@blackjack.show_hands).to match(/Player's hand/)    
      expect(@blackjack.show_hands).to match(/Total Value:/)    
      expect(@blackjack.show_hands).to match(/Dealer's hand:/)
      expect(@blackjack.show_hands).to match(/Total Value:/)
    end
  end
end