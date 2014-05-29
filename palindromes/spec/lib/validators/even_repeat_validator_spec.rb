# encoding: utf-8
require 'spec_helper'

describe EvenRepeatValidator do
  context '#validate?' do
    it 'returns true if even-size string repeats each char even times' do
      expect(subject.validate? 'atgagaaddteaetuaut').to be_true
    end
    it('returns false if even-size string repeats a char odd times') do
      expect(subject.validate? 'gxagaddeetuuvt').to be_false
    end
    it 'returns true if odd-size string repeats each repeated char even times' \
    do
      expect(subject.validate? 'ggggaaaattrrrrrry').to be_true
    end
    it 'returns true for cases like "gaagaag", where a repeated char takes
    the rol of the isolated char' do
      expect(subject.validate? 'gaagaag').to be_true
    end
    it 'returns true for cases like "gaataag", where a no-repeated char takes
    the rol of the isolated char' do
      expect(subject.validate? 'gaataag').to be_true
    end
    it 'returns false for cases like "gaatfqaag"' do
      expect(subject.validate? 'gaatfqaag').to be_false
    end
  end
end
