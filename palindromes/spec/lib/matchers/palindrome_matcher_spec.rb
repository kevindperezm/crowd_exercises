# encoding: utf-8
require 'spec_helper'

describe PalindromeMaker do
  it 'responds to "can_build_palindromes_from?"' do
    expect(subject).to respond_to :can_build_palindromes_from?
  end

  context '#can_build_palindromes_from?' do
    it 'returns true when you can create a palindrome from even-length word' do
      expect(subject.can_build_palindromes_from? 'gaga').to be_true
    end
    it 'returns true if you can create palindrome from odd-length word' do
      expect(subject.can_build_palindromes_from? 'akako').to be_true
    end
    it 'returns false when you can\'t create a palindrome from the word' do
      expect(subject.can_build_palindromes_from? 'gagasdqwe').to be_false
    end
    it 'returns true when even-length word has 1 char repeated odd times' do
      expect(subject.can_build_palindromes_from? 'lolloii').to be_true
    end

  end
end
