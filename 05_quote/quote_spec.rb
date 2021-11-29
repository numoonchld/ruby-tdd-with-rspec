require_relative 'quote'

RSpec.describe QuoteString do
  
  before do
    @placeholder = 5 + 10
    @interpolated = "The sum of 5+10 is 15"
  end

  context 'quotes with %q' do
    it 'should not output interpolated text' do
      # %q behaves like single quotes
      sentence = %q{The sum of 5+10 is #{@placeholder}}
      text = QuoteString.new sentence
      expect(text.to_s.start_with?('The sum')).to eq(true)
      expect(text.to_s).not_to eq(@interpolated)
    end
  end
  context 'quotes with %Q' do
    it 'should output interpolated text' do
      # %Q behaves like double quotes or back-ticks
      sentence = %Q{The sum of 5+10 is #{@placeholder}}
      text = QuoteString.new sentence
      expect(text.to_s.start_with?('The sum')).to eq(true)
      expect(text.to_s).to eq(@interpolated)
    end
  end
end