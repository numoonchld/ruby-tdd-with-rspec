class BasicString
  attr_reader :sentence

  def initialize(sentence)
    @sentence = sentence
  end

  def contains_word?(word)
    @sentence.include?(word)
  end

  def contains_word_ignorecase?(word)
    @sentence.downcase.include?(word.downcase)
  end
end