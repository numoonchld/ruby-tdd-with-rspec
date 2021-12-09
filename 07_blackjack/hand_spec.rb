require_relative 'hand'
require_relative 'card'

RSpec.describe Hand do
  
  before do
    @hand = Hand.new
  end

  it 'responds to dealt_cards' do
    expect(@hand).to respond_to :dealt_cards
  end
  
  describe '#add_card' do
    it 'responds to add card' do
      expect(@hand).to respond_to :add_card
      
    end
    it 'returns the correct cards added' do
      card_a = Card.new('Diamonds','Jack')
      card_b = Card.new('Clubs','Ace')      

      @hand.add_card card_a
      @hand.add_card card_b

      expect(@hand.dealt_cards.size).to eq 2

      expect(@hand.dealt_cards.first.suit).to eq 'Diamonds'
      expect(@hand.dealt_cards.last.suit).to eq 'Clubs'

      expect(@hand.dealt_cards.first.rank).to eq 'Jack'
      expect(@hand.dealt_cards.last.rank).to eq 'Ace'
    end
  end

  describe '#get_value' do
    it 'responds to get_value' do
      expect(@hand).to respond_to :get_value
    end
    it 'returns correct value without Ace' do
      card_a = Card.new('Diamonds','Jack')
      card_b = Card.new('Clubs','9')      
      
      @hand.add_card card_a
      @hand.add_card card_b

      expect(@hand.get_value).to eq 10 + 9
    end
    it 'returns correct value with an Ace and a Jack' do
      card_a = Card.new('Diamonds','Jack')
      card_b = Card.new('Clubs','Ace')      
      
      @hand.add_card card_a
      @hand.add_card card_b

      expect(@hand.get_value).to eq 10 + 11
    end
  end

  describe 'hand output' do
    it 'returns the correct output if show is true for all cards' do
      @hand.add_card Card.new('Diamonds', 'Jack')
      @hand.add_card Card.new('Clubs', 'Ace')

      expect("#{@hand}").to eq "Jack of Diamonds, Ace of Clubs, Total Value: 21"      
    end

    it 'returns the correct output if show is false for a card' do
      card_a = Card.new('Diamonds','Jack')
      card_b = Card.new('Clubs','Ace')     
      
      card_a.show = false 
      
      @hand.add_card card_a
      @hand.add_card card_b

      expect("#{@hand}").to eq "Ace of Clubs, Total Value: 11"
    end

    it 'returns the correct output if show is false for a card, and first card is an ace' do
      card_a = Card.new('Diamonds','Ace')
      card_b = Card.new('Clubs','Jack')     
      
      card_a.show = false 
      
      @hand.add_card card_a
      @hand.add_card card_b

      expect("#{@hand}").to eq "Jack of Clubs, Total Value: 10"
    end
  end
end