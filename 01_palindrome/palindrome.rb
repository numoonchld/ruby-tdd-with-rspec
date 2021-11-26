class Palindrome
  def self.is?(word)
    word.downcase == word.downcase.reverse
  end
end