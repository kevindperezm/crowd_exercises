# encoding: utf-8
require 'spec_helper'

describe RepetitionCountValidator do
  context '#validate' do
    it 'returns true if even-size string repeats each char even times' do
      expect(subject.validate 'atgagaaddteaetuaut').to be_true
    end
    it('returns false if even-size string repeats a char odd times') do
      expect(subject.validate 'gxagaddeetuuvt').to be_false
    end
    it 'returns true if odd-size string repeats each repeated char even times' \
    do
      expect(subject.validate 'ggggaaaattrrrrrry').to be_true
    end
    it 'returns false if odd-size string repeats a repeated char odd times' \
    do
      expect(subject.validate 'ggggaaaattrrrrrrt').to be_false
    end
  end
end
