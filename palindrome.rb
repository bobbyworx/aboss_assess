module Palindrome

  def self.is_palindrome(word)
    wlength = word.length
    return true if wlength == 1
    # downcasing the word mutating the object
    word.downcase!
    idx = 0

    # compare equality of the word's halfs
    while idx < wlength / 2
      return false unless word[idx] == word[wlength - idx -1]
      idx += 1
    end
    true
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
