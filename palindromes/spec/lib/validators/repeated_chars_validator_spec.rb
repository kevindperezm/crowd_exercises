# encoding: utf-8
require 'spec_helper'

describe RepeatedCharsValidator do
  context '#validate?' do
    it 'returns true if even-size string repeats each char at least 2 times' do
      expect(subject.validate? 'gagaddeetuut').to be_true
    end
    it('returns false if even-size string repeats a char less than 2 times') do
      expect(subject.validate? 'gxagaddeetuuvt').to be_false
    end
    it 'returns true if odd-size string repeats chars - 1 at least 2 times' do
      expect(subject.validate? 'gagaddeextuut').to be_true
    end
    it 'returns false if odd-size string repeats a char less than 2 times' do
      expect(subject.validate? 'gagaddeextuuvdftpjn').to be_false
    end
    it 'returns true for cases like "gaagaag", where a repeated char takes
    the rol of the isolated char' do
      expect(subject.validate? 'gaagaag').to be_true
    end
    it 'returns true for cases like "gaataag", where a no-repeated char takes
    the rol of the isolated char' do
      expect(subject.validate? 'gaataag').to be_true
    end
  end
end
