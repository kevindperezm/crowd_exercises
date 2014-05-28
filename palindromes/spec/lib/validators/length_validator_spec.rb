# encoding: utf-8
require 'spec_helper'

describe LengthValidator do
  context '#validate' do
    it('should return true if word length >= 2') do
      expect(subject.validate('gaga')).to be_true
    end
    it('should return false if word length < 2') do
      expect(subject.validate('g')).to be_false
    end
  end
end
