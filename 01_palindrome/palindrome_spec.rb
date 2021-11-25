require_relative 'palindrome'

RSpec.describe Palindrome do 

  context 'word is a palindrome' do
    it 'should read the same forwards and backwards' do
      test_word = "Madam"
      expect(Palindrome.is? test_word ).to be_truthy
    end
  end

  context 'word is not a palindrome' do 
    it 'should not read the same forwards and backwards' do
      test_word = "Food"
      expect(Palindrome.is? test_word ).to be_falsy
    end
  end
end