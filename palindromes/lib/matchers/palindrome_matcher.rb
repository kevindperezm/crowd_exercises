# encoding: utf-8

# Adds #repeats to String class
class String
  def repeats(char)
    times_repeatead = scan(char).length
    times_repeatead > 0 ? times_repeatead : false
  end
end

# This class has methods to detect if a word's chars can be used to create
# palindromes and to create palindromes with them.
class PalindromeMaker
  MIN_WORD_LENGTH = 2
  MIN_CHAR_REPEAT_TIMES = 2
  SINGLE_CHAR_LENGTH = 1

  def can_build_palindromes_from?(word)
    @found_isolated_char = false
    min_length?(word) && repeats_each_char?(word, MIN_CHAR_REPEAT_TIMES)
  end

  private

  def min_length?(word)
    word.length >= MIN_WORD_LENGTH
  end

  def repeats_each_char?(word, times)
    return_value = false
    word.each_char do |char|
      if word.length.even? && word.repeats(char).even?
        return_value = word.repeats(char) >= times
      elsif word.repeats(char) == SINGLE_CHAR_LENGTH || word.repeats(char).odd?
        return_value = @found_isolated_char ? false : true
        @found_isolated_char = true
      end
    end
    return_value
  end
end
