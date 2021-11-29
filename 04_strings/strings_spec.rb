require_relative 'strings'

RSpec.describe BasicString do

  before do
    @test_word = 'Ruby'
    @sentence = 'There is a gemstone called ruby in existence'
  end

  context 'case-sensitive' do
    it 'should output interpolated text' do
      text = BasicString.new(@sentence)
      result = text.contains_word? @test_word

      expect(result).to be_falsy
    end
  end

  context 'case in-sensitive' do
    it 'should output interpolated text' do
      text = BasicString.new(@sentence)
      result = text.contains_word_ignorecase? @test_word

      expect(result).to be_truthy
    end
  end
end 