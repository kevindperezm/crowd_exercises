# encoding: utf-8
require 'spec_helper'

describe EvenRepeatValidator do
  context '#validate?' do
    it 'returns true if even-size string repeats each char even times' do
      expect(subject.validate? 'atgagaaddteaetuaut').to eql true
    end
    it('returns false if even-size string repeats a char odd times') do
      expect(subject.validate? 'gxagaddeetuuvt').to eql false
    end
    it 'returns true if odd-size string repeats each repeated char even times' \
    do
      expect(subject.validate? 'ggggaaaattrrrrrry').to eql true
    end
    it 'returns true for cases like "gaagaag", where a repeated char takes
    the rol of the isolated char' do
      expect(subject.validate? 'gaagaag').to eql true
    end
    it 'returns true for cases like "gaataag", where a no-repeated char takes
    the rol of the isolated char' do
      expect(subject.validate? 'gaataag').to eql true
    end
    it 'returns false for cases like "gaatfqaag"' do
      expect(subject.validate? 'gaatfqaag').to eql false
    end
  end
end
