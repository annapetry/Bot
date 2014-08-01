class String
  def sentences
    self.gsub(/\n|\r/, ' ').split(/\.\s*/)
  end
  
  def words
    self.scan(/\w[\w'\-]*/)
  end
end


class WordPlay
  def self.switch_pronouns(text)
    text.gsub(/\b(I am|You are|I|You|Me|Your|My)\b/i) do |pronoun|
      case pronoun.downcase
        when "i"
          "you"
        when "you"
          "me"
        when "me"
          "you"
        when "i am"
          "you are"
        when "you are"
          "i am"
        when "your"
          "my"
        when "my"
          "your"
      end
    end.sub(/^me\b/i, 'i')
  end
  
  def self.best_sentence(sentences, desired_words)
    ranked_sentences = sentences.sort_by do |s|
      s.words.length - (s.downcase.words - desired_words).length
    end
    ranked_sentences.last
  end
end







# hot_words = %w{test ruby}
# array = []
# my_string = "This is a test. Dull sentence here. Ruby is great. So is cake."
# my_string.sentences.find_all do |s|
#   s.downcase.words.any? { |word| hot_words.include?(word) ? array << s : next}
# end
#
# p array




#
# p %q{Hello. This is a test of basic
#   sentence splitting. It even works
#   over multiple lines!}.sentences[1].words[3]
#
#   p %q{This is a test of words' capabilities.}.words