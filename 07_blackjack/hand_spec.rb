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
      
    end
  end

  describe 'hand output' do
    it 'returns the correct output if show is true for all cards' do
      
    end

    it 'returns the correct output if show is false for a card' do
      
    end
  end
end