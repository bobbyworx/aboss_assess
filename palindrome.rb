module Palindrome

  def self.is_palindrome(word)
    # downcasing the word and mutating the object
    word.downcase!
    reversed = ''
    idx = word.length

    # iterate through each char starting at the end
    # and composing our reversed string
    while idx > 0
      idx -= 1
      reversed << word[idx]
    end
    # ternary checking for string equality
    (word == reversed) ? true : false
  end

  def self.shorthand_palindrome(word)
    # downcase and mutate the object
    word.downcase!
    # use String#reverse and a ternary to check for string equality
    word.reverse == word ? true : false
  end
end

puts Palindrome.is_palindrome('Deleveled')
puts Palindrome.shorthand_palindrome('Deleveled')
